import '../App.css';
import { useNavigate } from 'react-router-dom';
import { useState, useEffect } from 'react';
import '../../node_modules/bootstrap/dist/css/bootstrap.min.css'; 
import BootstrapTable from 'react-bootstrap-table-next';
import axios from 'axios';

export default function Root() {
  const nav = useNavigate();
  const [projects, setProjects] = useState([]);
  const getProjects = async () => {
    const config = { };
    const response = await axios.get("http://127.0.0.1:5000/", config);
    const jsonData = await response;
    var data = await jsonData.data.data;
    setProjects(data);
  };
  const goToDetails = async (id) =>{
    const url = "/details/"+id;
    nav(url);
  };
  useEffect(() => {
    getProjects();
  }, []);
  return(
    <div id="root">
      <h3 className="text-center"> Projects </h3>
      <BootstrapTable 
        striped
        hover
        keyField='project_id' 
        data={projects} 
        columns={[
          {
            dataField: 'name',
            text: 'Project Name',
            sort: true
          }, {
            dataField: 'start_date',
            text: 'Start Date',
            sort: true
          }, {
            dataField: 'project_id',
            text: 'Show Project Details',
            formatter: (cellContent, row) => {
            return (
              <button
                className="btn btn-info btn-xs"
                onClick={() => goToDetails(row.project_id)}
              >
                Details
              </button>
            );
          }
        }]}
      />
    </div>
  );
}
