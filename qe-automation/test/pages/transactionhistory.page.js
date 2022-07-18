const utils = require('../../utilities/commonUtils');
const transactionHistoryPage = require('../../test/screens/transactionHistory.screen');

class TransactionHistoryPage {
    shouldSeeScanYourCardDetailsPage() {
        utils.waitForElement(transactionHistoryPage.transaction_history_title, true);
    }

    shouldSeeRequiredFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'TransactionType_All':
                    utils.waitForElement(transactionHistoryPage.TransactionType_ALL, true);
                    break;
                case 'TransactionType_OUT':
                    utils.waitForElement(transactionHistoryPage.TransactionType_OUT, true);
                    break;
                case 'TransactionType_IN':
                    utils.waitForElement(transactionHistoryPage.TransactionType_IN, true);
                    break;
                case 'Duration_Filter':
                    utils.waitForElement(transactionHistoryPage.Duration, true);
                    break;
                case 'Search bar':
                    utils.waitForElement(transactionHistoryPage.Search_bar, true);
                    break;
                default:
                    throw new Error(`transaction details field - ${data} - not found.`);
            }
        })
    };

    clickTransaction() {
        utils.clickOnElement(transactionHistoryPage.transaction);
    }

    shouldSeeMainSection() {
        utils.waitForElement(transactionHistoryPage.mainSection, true);
    }

    clickExpandSection() {
        utils.clickOnElement(transactionHistoryPage.expandOption);
    }

    shouldSeeDownloadOption() {
        utils.waitForElement(transactionHistoryPage.downloadJPG, true);
    }

    clickDownloadJPG() {
        utils.clickOnElement(transactionHistoryPage.downloadJPG);
    }

    shouldSeeEmptyTransactionMessage() {
        utils.waitForElement(transactionHistoryPage.noTransactionMessage, true);
    }

    shouldSeeTransactionDetail() {
        utils.isVisibleElement(transactionHistoryPage.transactionDetail_heading, true);
    }

    shouldSeeShareOption() {
        utils.isVisibleElement(transactionHistoryPage.share_button, true);
    }

    shouldSeeSuccessPopup() {
        utils.isVisibleElement(transactionHistoryPage.success_popup, true);
    }

    clickShareOption() {
        utils.clickOnElement(transactionHistoryPage.share_button);
    }

    clickOnBackButton() {
        utils.clickOnElement(transactionHistoryPage.back_button);
    }
}

export default new TransactionHistoryPage();
