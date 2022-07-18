const utils = require('../../utilities/commonUtils');
const profile_managementScreen = require('../../test/screens/profile_management.screen');

class ProfileManagementPage {
    clickManageWallet() {
        utils.clickOnElement(profile_managementScreen.manage_wallet);
    }

    shouldSeeManageAccount() {
        utils.isVisibleElement(profile_managementScreen.manageWalletHeading, true);
    }

    shouldSeeManageWalletDetails(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'Bank_name':
                    utils.isVisibleElement(profile_managementScreen.Bank_name, true);
                    break;
                case 'IBAN_number':
                    utils.isVisibleElement(profile_managementScreen.IBAN_number, true);
                    break;
                default:
                    throw new Error(`${data[0]} - not found.`);
            }
        });
    }

    shouldSeeCopyDetailButton() {
        utils.isVisibleElement(profile_managementScreen.copyDetail_button, true);
    }

    clickCopyDetailButton() {
        utils.clickOnElement(profile_managementScreen.copyDetail_button)
    }

    shouldSeePopupMessage() {
        utils.isVisibleElement(profile_managementScreen.popup_message, true);
        utils.isVisibleElement(profile_managementScreen.popup_message2, true);
    }

    shouldSeeWalletScreenFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'Wallet_accountHeading':
                    utils.isVisibleElement(profile_managementScreen.manageWalletHeading, true);
                    break;
                case 'Bank_name':
                    utils.isVisibleElement(profile_managementScreen.Bank_name, true);
                    break;
                case 'IBAN_number':
                    utils.isVisibleElement(profile_managementScreen.IBAN_number, true);
                    break;
                case 'CopyDetail_button':
                    utils.isVisibleElement(profile_managementScreen.copyDetail_button, true);
                    break;
                case 'Account_limit_placeholder':
                    utils.isVisibleElement(profile_managementScreen.account, true);
                    break;
                default:
                    throw new Error(`${data[0]} - not found.`);
            }
        });
    }

    shouldSeeServerSideFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'server_side_error':
                    utils.isVisibleElement(profile_managementScreen.server_side_error, true);
                    break;
                case 'ok_button':
                    utils.isVisibleElement(profile_managementScreen.ok_button, true);
                    break;
                default:
                    throw new Error(`${data[0]} - not found.`);
            }
        });
    }

    shouldSeeErrorScreen() {
        utils.isVisibleElement(profile_managementScreen.server_side_error, true);
        utils.isVisibleElement(profile_managementScreen.serverError, true);
        utils.isVisibleElement(profile_managementScreen.suberror_title, true);
        utils.isVisibleElement(profile_managementScreen.error_image, true);
        utils.isVisibleElement(profile_managementScreen.ok_button, true);
    }

    clickOkButton() {
        utils.clickOnElement(profile_managementScreen.ok_button);
    }

    shouldSeeHomepage() {
        utils.isVisibleElement(profile_managementScreen.homepage, true);
    }
}

export default new ProfileManagementPage();
