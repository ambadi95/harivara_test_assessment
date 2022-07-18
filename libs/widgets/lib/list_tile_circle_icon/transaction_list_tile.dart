import 'package:core/ioc/di_container.dart';
import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/data_models/app_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_data_models/transaction/transaction.dart';
import 'package:shared_data_models/transaction/transaction_category.dart';
import 'package:shared_data_models/transaction/transaction_models/added_funds.dart';
import 'package:shared_data_models/transaction/transaction_models/p2m.dart';
import 'package:widget_library/icons/crayon_payment_icon_paths.dart';
import 'package:widget_library/list_tile_circle_icon/crayon_payment_icon_avatar.dart';
import 'package:widget_library/list_tile_circle_icon/crayon_payment_list_tile.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class CrayonPaymentTransactionListTile extends CrayonPaymentListTile {
  final AppInfoRetriever appInfoRetriever;

  CrayonPaymentTransactionListTile(
    Transaction _transaction, {
    Widget? trailWidgetTransaction,
    String? subTitle,
    String? title,
    Function(Transaction)? onTap,
    AppInfoRetriever? appInfoRetriever,
    Key? key,
  })  : appInfoRetriever = appInfoRetriever ??
            DIContainer.container.resolve<AppInfoRetriever>(),
        super(
          title != null
              ? CrayonPaymentText(
                  text: TextUIDataModel(
                    title,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: CrayonPaymentColors.crayonPaymentBlack,
                  ),
                  key: Key('title'),
                )
              : CrayonPaymentText(
                  text: TextUIDataModel(
                    !(appInfoRetriever?.appType is MerchantApp) &&
                            _transaction.category is P2MCategory
                        ? 'N/A'
                        : _transaction.mainTitleDisplayName,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: CrayonPaymentColors.crayonPaymentBlack,
                  ),
                  key: Key('title'),
                ),
          subTitle != null
              ? CrayonPaymentText(
                  text: TextUIDataModel(
                    subTitle,
                    styleVariant: CrayonPaymentTextStyleVariant.headline5,
                    color: CrayonPaymentColors.crayonPaymentDarkGray,
                  ),
                  key: Key('subtitle'),
                )
              : (appInfoRetriever?.appType is MerchantApp) &&
                      (_transaction is P2MTransaction)
                  ? null
                  : CrayonPaymentText(
                      text: TextUIDataModel(
                        _transaction.toString(),
                        styleVariant: CrayonPaymentTextStyleVariant.headline5,
                        color: CrayonPaymentColors.crayonPaymentDarkGray,
                      ),
                      key: Key('subtitle'),
                    ),
          trailWidget: trailWidgetTransaction ??
              CrayonPaymentText(
                key: const Key('amount_text'),
                text: TextUIDataModel(
                  '${_transaction.type.when(
                    debit: () => '-',
                    credit: () => '+',
                    notAvailable: () => '/',
                  )}${_transaction.amount.toStringAsFixed(2)}',
                  styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  color: _transaction.type.maybeWhen(
                    credit: () => Colors.green,
                    orElse: () => null,
                  ),
                ),
              ),
          onTapCallbackListTile: () => onTap!(_transaction),
          displayIcon: CrayonPaymentIconAvatar(
            title ?? _transaction.mainTitleDisplayName,
            _transaction.category.maybeWhen(
              addedFunds: () => CrayonPaymentColors.crayonPaymentAliceBlue,
              sentFunds: () => CrayonPaymentColors.crayonPaymentRoseWhite,
              receivedFunds: () => CrayonPaymentColors.crayonPaymentClearDay,
              subscription: () => CrayonPaymentColors.crayonPaymentWhiteSmoke,
              purchase: () => CrayonPaymentColors.crayonPaymentTutu,
              refund: () => CrayonPaymentColors.crayonPaymentFloralWhite,
              orElse: () => CrayonPaymentColors.crayonPaymentRoseWhite,
            ),
            _transaction.category.maybeWhen(
              addedFunds: () => CrayonPaymentColors.crayonPaymentPictonBlue,
              sentFunds: () => CrayonPaymentColors.crayonPaymentJaffa,
              receivedFunds: () => CrayonPaymentColors.crayonPaymentGossamer,
              subscription: () => CrayonPaymentColors.crayonPaymentDimGray,
              purchase: () => CrayonPaymentColors.crayonPaymentValencia,
              refund: () => CrayonPaymentColors.crayonPaymentRonchi,
              orElse: () => CrayonPaymentColors.crayonPaymentJaffa,
            ),
            displayIconTile: _transaction is AddedFunds
                ? SvgPicture.asset(CrayonPaymentIconPath.iconAddedFund)
                : null,
          ),
        );
}
