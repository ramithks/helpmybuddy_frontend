import 'package:flutter/material.dart';
import '../../global_index.dart';
import '../../main.dart';

class SnackbarUtils {
  static Color _getColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.error:
        return AppColors.red;
      case SnackbarType.warning:
        return AppColors.orange;
      case SnackbarType.info:
        return AppColors.blue;
      default:
        return Colors.grey;
    }
  }

  static IconData _getIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.error:
        return Icons.error;
      case SnackbarType.warning:
        return Icons.warning;
      case SnackbarType.info:
        return Icons.info;
      default:
        return Icons.info_outline;
    }
  }

  static void showSnackbar({
    String message = 'something went wrong',
    SnackbarType? type, // Nullable SnackbarType
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? actionOnPressed,
  }) {
    final resolvedType = type ?? SnackbarType.generic;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(_getIcon(resolvedType), color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
                child:
                    Text(message, style: const TextStyle(color: Colors.white))),
          ],
        ),
        backgroundColor: _getColor(resolvedType),
        duration: duration,
        action: actionLabel != null && actionOnPressed != null
            ? SnackBarAction(
                label: actionLabel,
                onPressed: actionOnPressed,
                textColor: AppColors.white,
              )
            : null,
      ),
    );
  }
}
