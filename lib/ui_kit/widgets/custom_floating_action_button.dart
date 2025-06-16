import '../../core/core.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function() onTap;

  const CustomFloatingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Icon(Icons.add, color: Colors.white, size: 25,),
    );
  }
}
