import '../App.css';
import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import '../../node_modules/bootstrap/dist/css/bootstrap.min.css'; 
import BootstrapTable from 'react-bootstrap-table-next';
import { useParams } from "react-router";
import { Link } from "react-router-dom";
import { FaHome } from 'react-icons/fa';
export default function Details() {
  const { projectId } = useParams();
  var [display, setDisplay] = useState([]);
  var [columns, setColumns] = useState([
          {
            dataField: 'name',
            text: 'File Name',
            sort: true
          }, {
            dataField: 'type',
            text: 'File Type',
            sort: true
          }]);
  const getFiles = async () => {
    const response = await fetch("http://127.0.0.1:5000/projectFiles/"+projectId);
    const jsonData = await response.json();
    var data = await jsonData.data;
    setDisplay(data);
  };
  const getUsers = async () => {
    const response = await fetch("http://127.0.0.1:5000/projectUsers/"+projectId);
    const jsonData = await response.json();
    var data =await jsonData.data;
    setDisplay(data);
  };
  const showFiles = async ()  => {
    getFiles();
    var cols = [
          {
            dataField: 'name',
            text: 'File Name',
            sort: true
          }, {
            dataField: 'type',
            text: 'File Type',
            sort: true
          }
        ];
    setColumns(cols);
  };
  const showUsers = async()  => {
    getUsers();
    setColumns([
          {
            dataField: 'name',
            text: 'Name',
            sort: true
          }, {
            dataField: 'email',
            text: 'E-mail',
            sort: true
          }
        ]);
  };
  useEffect(() => {
    getFiles();
  }, []);
  return(
    <div id="details" className="details">
      <h3 className="text-center"> Project's Details</h3>
      <Link to="/">
        <button className="btn btn-info"> Home <FaHome/> </button>
      </Link>
      <div style={{marginTop: 24+'px'}}>
        <button className="btn" style={{marginRight: 10 +'px'}}onClick={showFiles}>Files</button>
        <button className="btn" onClick={showUsers}>Users</button>
      </div>
      <BootstrapTable 
        striped
        hover
        keyField='name' 
        data={display} 
        columns={columns}
      />
    </div>
  );
}
