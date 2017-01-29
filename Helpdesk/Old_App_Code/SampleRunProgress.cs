/*
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using RuProgressBar;

namespace Helpdesk.Old_App_Code
{
    
    partial class Helpdesk.Old_App_Code
    {
        /// <summary>
        /// This function run a processing and display the progress with RuProgressBar
        /// </summary>
        public void RunProgress()
        {
            try
            {
                // Init ProgressBar
                ProgressWindow progress = new ProgressWindow();
                progress.Text = "Run Application";

                // Run Application with ProgressBar
                System.Threading.ThreadPool.QueueUserWorkItem(new System.Threading.WaitCallback(Test), progress);
                progress.ShowDialog();
            }
            catch
            {   
            }

        }
        /// <summary>
        ///  Function of progress should appear 
        /// </summary>
        /// <param name="status"></param>
        public void Test(object status)
        {
            try
            {
                IProgressCallback callback = status as IProgressCallback;
                
                // Init Progressbar
                int iMax = 1000000;
                callback.Begin(0, iMax / 10);

                for (int i = 0; i < iMax; i++)
                {
                    if (i % 10 == 0 & i > 0)
                    {
                        // Change Progressbar
                        callback.StepTo(i / 10);
                    }

                }
                // End Progressbar
                callback.End();

            }
            catch (System.FormatException)
            {
            }
        }
    }
    
}
*/
