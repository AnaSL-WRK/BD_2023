namespace Lab01
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.testcon = new System.Windows.Forms.Button();
            this.password = new System.Windows.Forms.TextBox();
            this.helloTable = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.user = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.server = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // testcon
            // 
            this.testcon.Location = new System.Drawing.Point(207, 314);
            this.testcon.Name = "testcon";
            this.testcon.Size = new System.Drawing.Size(190, 100);
            this.testcon.TabIndex = 0;
            this.testcon.Text = "Test Connection";
            this.testcon.UseVisualStyleBackColor = true;
            this.testcon.Click += new System.EventHandler(this.testcon_Click);
            // 
            // password
            // 
            this.password.AccessibleName = "";
            this.password.Location = new System.Drawing.Point(189, 233);
            this.password.Name = "password";
            this.password.PasswordChar = '•';
            this.password.Size = new System.Drawing.Size(466, 23);
            this.password.TabIndex = 1;
            this.password.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // helloTable
            // 
            this.helloTable.Location = new System.Drawing.Point(453, 314);
            this.helloTable.Name = "helloTable";
            this.helloTable.Size = new System.Drawing.Size(190, 100);
            this.helloTable.TabIndex = 2;
            this.helloTable.Text = "Hello Table";
            this.helloTable.UseVisualStyleBackColor = true;
            this.helloTable.Click += new System.EventHandler(this.helloTable_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(64, 231);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 21);
            this.label1.TabIndex = 3;
            this.label1.Text = "Password";
            // 
            // user
            // 
            this.user.Location = new System.Drawing.Point(189, 177);
            this.user.Name = "user";
            this.user.Size = new System.Drawing.Size(208, 23);
            this.user.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(64, 175);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(42, 21);
            this.label2.TabIndex = 5;
            this.label2.Text = "User";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // server
            // 
            this.server.Location = new System.Drawing.Point(189, 111);
            this.server.Name = "server";
            this.server.Size = new System.Drawing.Size(466, 23);
            this.server.TabIndex = 6;
            this.server.TextChanged += new System.EventHandler(this.server_Text);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label3.Location = new System.Drawing.Point(64, 109);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 21);
            this.label3.TabIndex = 7;
            this.label3.Text = "Server";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.server);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.user);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.helloTable);
            this.Controls.Add(this.password);
            this.Controls.Add(this.testcon);
            this.ForeColor = System.Drawing.SystemColors.ControlText;
            this.Name = "Form1";
            this.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.RightToLeftLayout = true;
            this.Text = "Aula 1 BD";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Button testcon;
        private TextBox password;
        private Button helloTable;
        private Label label1;
        private TextBox user;
        private Label label2;
        private TextBox server;
        private Label label3;
    }
}