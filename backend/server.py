# Using flask to make an api
# import necessary libraries and functions
from flask import Flask, jsonify, request
from sqlalchemy import select, Column, Table, ForeignKey, MetaData, String, Integer, DateTime, create_engine
from sqlalchemy.orm import sessionmaker, declarative_base,relationship, class_mapper
import decimal
from datetime import datetime, date
from sqlalchemy.inspection import inspect
import json
from flask_cors import CORS
Base = declarative_base()


def alchemyencoder(obj):
  """JSON encoder function for SQLAlchemy special classes."""
  if isinstance(obj, (datetime, date)):
    return obj.isoformat()
  raise TypeError ("Type %s not serializable" % type(obj))

class Users(Base):
  __tablename__ = "users"
  user_id = Column(Integer, primary_key=True)
  name = Column(String(150))
  email = Column(String(80))
  def __repr__(self):
    return f"<User name={self.name} email={self.email}>"
  @property
  def serialize(self):
     """Return object data in easily serializable format"""
     return {
         'id'         : self.id,
         'name'       : self.name,
         'email'      : self.email
     }

class Projects(Base):
  __tablename__ = "projects"
  id = Column(Integer, primary_key=True)
  name = Column(String(150))
  date_created = Column(DateTime(), default=datetime.utcnow)
  def __repr__(self):
    return f"<Project name={self.name} date_created={self.date_created}>"
  @property
  def serialize(self):
     """Return object data in easily serializable format"""
     return {
         'id'         : self.id,
         'name'       : self.name,
         'start_date' : dump_datetime(self.date_created)
     }

class Files(Base):
  __tablename__ = "files"
  id = Column(Integer, primary_key=True)
  name = Column(String(150))
  type = Column(String(5))
  def __repr__(self):
    return f"<File name={self.name} type={self.type}>"
  @property
  def serialize(self):
     """Return object data in easily serializable format"""
     return {
         'id'         : self.id,
         'name'       : self.name,
         'type'       : self.type
     }

# declare the connection 
engine = create_engine("postgresql://postgres:panama@localhost:5432/postgres")
Session = sessionmaker(bind=engine)
session = Session()

# creating a Flask app
app = Flask(__name__)
CORS(app)
@app.route('/', methods = ['GET', 'POST'])
def home():
  if(request.method == 'GET'):
    metadata_obj = MetaData()
    projects = Table("projects", metadata_obj, autoload_with=engine)
    stmt = session.query(projects).all()
    return {'data': [dict(r) for r in stmt]}

@app.route('/projectFiles/<project>', methods =['GET'])
def files(project):
  if(request.method == 'GET'):
    metadata_obj = MetaData()
    proFiles = Table("projectFiles", metadata_obj, autoload_with=engine)
    qryFile = Table("files", metadata_obj, autoload_with=engine)
    stmt = session.query(proFiles,qryFile).where(proFiles.c.project_id==project).where(qryFile.c.file_id==proFiles.c.file_id)
    return {'data': [dict(r) for r in stmt]}

@app.route('/projectUsers/<project>', methods =['GET'])
def users(project):
  if(request.method == 'GET'):
    metadata_obj = MetaData()
    proUsers = Table("projectUsers", metadata_obj, autoload_with=engine)
    qryUsers = Table("users", metadata_obj, autoload_with=engine)
    stmt = session.query(proUsers, qryUsers).where(proUsers.c.project_id==project).where(qryUsers.c.user_id==proUsers.c.user_id)
    return {'data': [dict(r) for r in stmt]}


# driver function
if __name__ == '__main__':
  app.run(debug = True)