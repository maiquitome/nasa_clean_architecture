// first layer: domain

// The domain has no knowledge of the external world

// 1º create the domain
// 2º create the usecases

import 'package:equatable/equatable.dart';

// using Equatable for tests
class SpaceMediaEntity extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String mediaUrl;

  const SpaceMediaEntity({
    required this.description,
    required this.mediaType,
    required this.title,
    required this.mediaUrl,
  });

  // implemented because Equatable needs
  @override
  List<Object> get props => [
    description,
    mediaType,
    title,
    mediaUrl,
  ];
}
