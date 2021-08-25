using System;
using System.Data;
using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;

namespace DashboardCustomItemGantt {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            ASPxDashboard1.SetDataSourceStorage(CreateDataSourceStorage());
        }

        protected void ASPxDashboard1_DataLoading(object sender, DataLoadingWebEventArgs e) {
            if (e.DataId == "odsTaskData") {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(Server.MapPath("~/App_Data/GanttData.xml"));
                e.Data = dataSet.Tables[0];
            }
        }

        public DataSourceInMemoryStorage CreateDataSourceStorage() {
            DataSourceInMemoryStorage dataSourceStorage = new DataSourceInMemoryStorage();
            DashboardObjectDataSource objDataSource = new DashboardObjectDataSource("Object Data Source", typeof(TasksData));

            dataSourceStorage.RegisterDataSource("objectDataSource", objDataSource.SaveToXml());

            return dataSourceStorage;
        }
    }
}