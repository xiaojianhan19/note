using MyNote;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {

            ModelEvent mEvent = new ModelEvent();
            mEvent.Read();

            string conn_str = "Server=gnm-devrtft01;Port=5432;User ID=postgres;Database=note;Password=TSSummit00#;Enlist=true";

            using (NpgsqlConnection conn = new NpgsqlConnection(conn_str))
            {
                //PostgreSQLへ接続
                conn.Open();
                int i = 1;
                int j = 1;
                foreach (var item in mEvent.Items)
                {
                    int pId = 10000000 + i;
                    string cmd_str = string.Format("Insert into event (id, category, name, status) values ('{0}', '{1}', '{2}', '{3}' )",
                        pId, item.Category, item.Name, item.Status); //Convert.ToInt32(item.Id.Substring(1))
                    NpgsqlCommand cmd = new NpgsqlCommand(cmd_str, conn);
                    cmd.ExecuteNonQuery();


                    foreach(var child in item.Items)
                    {
                        int cId = 10000000 + j;
                        string cmd_str2 = string.Format("Insert into event_item (id, date, memo, time, event_id) values ('{0}', '{1}', '{2}', '{3}', {4} )",
                            cId, child.Date.ToString("yyyy-MM-dd"), child.Memo, child.Time, pId); //Convert.ToInt32(item.Id.Substring(1))
                        NpgsqlCommand cmd2 = new NpgsqlCommand(cmd_str2, conn);
                        cmd2.ExecuteNonQuery();
                        j++;
                    }

                    Console.WriteLine("Insert success!");
                    i++;
                }



                conn.Close();
            }
        }
    }
}
