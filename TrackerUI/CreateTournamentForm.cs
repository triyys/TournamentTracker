using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TrackerLibrary;
using TrackerLibrary.Models;

namespace TrackerUI
{
    public partial class CreateTournamentForm : Form, IPrizeRequester, ITeamRequester
    {
        List<TeamModel> availableTeams = GlobalConfig.Connection.GetTeam_All();
        List<TeamModel> selectedTeams = new List<TeamModel>();
        List<PrizeModel> selectedPrizes = new List<PrizeModel>();

        public CreateTournamentForm()
        {
            InitializeComponent();

            WireUpLists();
        }

        /// <summary>
        /// Load từ database Team và Prize khi form này hiện lên
        /// và khi hoàn thành việc thêm Prize hoặc Team
        /// </summary>
        private void WireUpLists()
        {
            selectTeamDropDown.DataSource = null;
            selectTeamDropDown.DataSource = availableTeams;
            selectTeamDropDown.DisplayMember = "TeamName";

            tournamentTeamsListBox.DataSource = null;
            tournamentTeamsListBox.DataSource = selectedTeams;
            tournamentTeamsListBox.DisplayMember = "TeamName";

            prizesListBox.DataSource = null;
            prizesListBox.DataSource = selectedPrizes;
            prizesListBox.DisplayMember = "PlaceName";
        }

        private void addTeamButton_Click(object sender, EventArgs e)
        {
            TeamModel t = (TeamModel)selectTeamDropDown.SelectedItem;

            if (t != null)
            {
                availableTeams.Remove(t);
                selectedTeams.Add(t);

                WireUpLists();
            }
        }

        private void createPrizeButton_Click(object sender, EventArgs e)
        {
            // Call the CreatePrizeForm
            CreatePrizeForm frm = new CreatePrizeForm(this);
            frm.Show();
        }

        public void PrizeComplete(PrizeModel model)
        {
            // Get back from the form a PrizeModel
            // Take the PrizeModel and put it into our list of selected prizes
            selectedPrizes.Add(model);
            WireUpLists();
        }

        public void TeamComplete(TeamModel model)
        {
            selectedTeams.Add(model);
            WireUpLists();
        }

        private void createNewTeamLink_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            CreateTeamForm frm = new CreateTeamForm(this);
            frm.Show();
        }

        private void removeSelectedPlayerButton_Click(object sender, EventArgs e)
        {
            TeamModel t = (TeamModel)tournamentTeamsListBox.SelectedItem;

            if (t != null)
            {
                selectedTeams.Remove(t);
                availableTeams.Add(t);

                WireUpLists();
            }
        }

        private void removeSelectedPrizeButton_Click(object sender, EventArgs e)
        {
            PrizeModel p = (PrizeModel)prizesListBox.SelectedItem;

            if (p != null)
            {
                selectedPrizes.Remove(p);

                WireUpLists();
            }
        }

        private void createTournamentButton_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                // Create our tournament model
                TournamentModel tm = new TournamentModel();

                tm.TournamentName = tournamentNameValue.Text;
                tm.EntryFee = int.Parse(entryFeeValue.Text);
                tm.Prizes = selectedPrizes;
                tm.EnteredTeams = selectedTeams;

                // TODO - Wire our matchups
                TournamentLogic.CreateRounds(tm);

                // Create Tournament entry
                // Create all of the prizes entries
                // Create all of team entries
                GlobalConfig.Connection.CreateTournament(tm);

                //tm.AlertUsersToNewRound();

                TournamentViewerForm frm = new TournamentViewerForm(tm);
                frm.Show();
                this.Close();
            }
        }

        /// <summary>
        /// Valid các trường thông tin cho một Tournament
        /// </summary>
        /// <returns>Show a message box if false</returns>
        private bool ValidateForm()
        {
            bool feeValid = decimal.TryParse(entryFeeValue.Text, out decimal fee);

            if (tournamentNameValue.Text == "")
            {
                MessageBox.Show("The tournament needs a name.");

                return false;
            }

            if (!feeValid || fee < 0)
            {
                MessageBox.Show("You need to enter a valid Entry Fee.",
                    "Invalid Fee",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);

                return false;
            }

            if (selectedPrizes.Count == 0)
            {
                MessageBox.Show("The tournament needs at least a prize.");

                return false;
            }

            if (selectedTeams.Count < 2)
            {
                MessageBox.Show("The tournament needs at least two teams.");

                return false;
            }

            return true;
        }
    }
}
