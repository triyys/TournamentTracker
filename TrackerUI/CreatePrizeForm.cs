﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TrackerLibrary;
using TrackerLibrary.DataAccess;
using TrackerLibrary.Models;

namespace TrackerUI
{
    public partial class CreatePrizeForm : Form
    {
        IPrizeRequester callingForm;

        public CreatePrizeForm(IPrizeRequester caller)
        {
            InitializeComponent();

            callingForm = caller;
        }

        private void createPrizeButton_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                PrizeModel model = new PrizeModel(
                    placeNameValue.Text,
                    placeNumberValue.Text,
                    prizeAmountValue.Text,
                    prizePercentageValue.Text);

                GlobalConfig.Connection.CreatePrize(model);

                callingForm.PrizeComplete(model);

                this.Close();

                //placeNameValue.Text = "";
                //placeNumberValue.Text = "";
                //prizeAmountValue.Text = "0";
                //prizePercentageValue.Text = "0";
            }
            else
            {
                MessageBox.Show("This form has invalid information. Please check it and try again.");
            }
        }
        private bool ValidateForm()
        {
            bool placeNumberValidNumber = int.TryParse(placeNumberValue.Text, out int placeNumber);

            if (!placeNumberValidNumber)
            {
                return false;
            }

            if (placeNumber < 1)
            {
                return false;
            }

            if (placeNameValue.Text.Length == 0)
            {
                return false;
            }

            bool prizeAmountValid = decimal.TryParse(prizeAmountValue.Text, out decimal prizeAmount);
            bool prizePercentageValid = double.TryParse(prizePercentageValue.Text, out double prizePercentage);

            if (!prizeAmountValid || !prizePercentageValid)
            {
                return false;
            }

            if (prizeAmount <= 0 && prizePercentage <= 0)
            {
                return false;
            }

            if (prizePercentage < 0 || prizePercentage > 100)
            {
                return false;
            }

            return true; // nen de true truc vi` day la` TH xay ra thuong` xuyen nhat
        }
    }
}
