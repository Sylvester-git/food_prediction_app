import 'package:equatable/equatable.dart';

class MealRecommedationModle extends Equatable {
  final String mptfd;
  final String mps;
  final String mptm;
  final String mpsw;
  final String mpdk;
  final String mpft;

  const MealRecommedationModle({
    required this.mptfd,
    required this.mps,
    required this.mptm,
    required this.mpsw,
    required this.mpdk,
    required this.mpft,
  });

  @override
  List<Object?> get props => [mptfd, mps, mptm, mpsw, mpdk, mpft];
}
