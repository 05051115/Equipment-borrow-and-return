using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DAL;

public partial class 器材借還系統 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        MultiView1.ActiveViewIndex = Convert.ToInt32(Menu1.SelectedValue);
    }



    protected void Button3_Click(object sender, EventArgs e)//器材登記確認送出
    {
        string InsertCmd;
        //string DeleteCmd;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");//搜尋每行核取選項
            if (cbox.Checked == true)
            {
                GridView1.Rows[i].Visible = false;//隱藏已借選項
                Response.Write(GridView1.Rows[i].Cells[1].Text + ", ");//顯示借的東西
                InsertCmd = "Insert Into borrow(mId,pNo) Values('" + DropDownList2.Text.Trim() + "','" + GridView1.Rows[i].Cells[0].Text + "')";
                SQLDataAccess.SQLUpdateInsertDelete(InsertCmd);
                //DeleteCmd = "Delete from Product where pNo='"+GridView1.Rows[i].Cells[0].Text+ "'";//不能直接把財產刪除,因為借用清單會用到,資料庫條件約束
                //SQLDataAccess.SQLUpdateInsertDelete(DeleteCmd);
            }
        }

        Response.Write(" 借用成功！");
    }

    protected void Button4_Click(object sender, EventArgs e)//查詢
    {
        string SelectBmd;
        string Str = DropDownList3.Text.Trim();
        SelectBmd = "select* from 借用清單檢視 where mId='" + DropDownList3.Text.Trim() + "'";
        DataSet ds = SQLDataAccess.SQLGetDataSet(SelectBmd);
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();
    }

    protected void Button5_Click(object sender, EventArgs e)//歸還
    {
        string DeleteBpn;
        //string SelectCmd;
        //SelectCmd = "select pNo from 借用清單檢視 where pNo=borrow.pNo";
        for (int i = 0; i < GridView3.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)GridView3.Rows[i].FindControl("CheckBox2");//搜尋每行核取選項
            if (cbox.Checked == true)
            {
                GridView3.Rows[i].Visible = false;//隱藏已還選項
                Response.Write(GridView3.Rows[i].Cells[5].Text);//財產名稱
                DeleteBpn = "Delete from borrow where pNo='" + GridView3.Rows[i].Cells[4].Text +
                    "' and mId='" + GridView3.Rows[i].Cells[3].Text + "' and mId='" + DropDownList3.Text.Trim() + "'";
                SQLDataAccess.SQLUpdateInsertDelete(DeleteBpn);
            }
        }
        Response.Write(" 已完成歸還");
    }

    protected void Button6_Click(object sender, EventArgs e)//新增學生資料
    {
        string InsertCmd;
        InsertCmd = "Insert Into Member(mId,name,phone,department,email) Values('" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','" + TextBox4.Text.Trim() + "','" + TextBox5.Text.Trim() + "')";
        SQLDataAccess.SQLUpdateInsertDelete(InsertCmd);
        Response.Write("新增成功！");
        GridView4.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}