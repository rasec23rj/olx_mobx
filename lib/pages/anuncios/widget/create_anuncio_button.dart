import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/widgets/store/page_store.dart';

class CreateAnuncioButton extends StatefulWidget {
  final ScrollController scrollController;
  const CreateAnuncioButton({super.key, required this.scrollController});

  @override
  State<CreateAnuncioButton> createState() => _CreateAnuncioButtonState();
}

class _CreateAnuncioButtonState extends State<CreateAnuncioButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<double>(begin: 0, end: 66).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.6)),
    );
    widget.scrollController.addListener(scrollChanged);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void scrollChanged() {
    final scrollPosition = widget.scrollController.position;
    if (scrollPosition.userScrollDirection == ScrollDirection.forward) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: 50,

            margin: EdgeInsets.only(
              bottom: animation.value,
              left: 10,
              right: 10,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[600],
              ),
              onPressed: () {
                GetIt.I<PageStore>().setPage(1);
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt_outlined),
                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      'Anunciar agora',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
