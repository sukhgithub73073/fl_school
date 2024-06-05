part of 'image_pick_bloc.dart';

sealed class ImagePickEvent extends Equatable {
  const ImagePickEvent();
}

class ChangeImagePickEvent extends ImagePickEvent {
  const ChangeImagePickEvent();

  @override
  List<Object?> get props => [];
}
