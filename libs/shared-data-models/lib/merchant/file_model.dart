class FileModel {
  String name;
  String documentType;
  String path;
  String screenName;

  FileModel({
    required this.name,
    required this.documentType,
    required this.path,
    required this.screenName,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        name: json['name'],
        documentType: json['documentType'],
        path: json['path'],
        screenName: json['screenName'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'documentType': documentType,
        'path': path,
        'screenName': screenName
      };
}

class UploadFileResponse {
  int status;
  UploadFilePayload payload;

  UploadFileResponse({
    required this.status,
    required this.payload,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      UploadFileResponse(
        status: json['status'],
        payload: UploadFilePayload.fromJson(json['payload']),
      );
}

class UploadFilePayload {
  String fileName;
  String documentId;
  String message;
  String? referenceId;

  UploadFilePayload({
    required this.fileName,
    required this.documentId,
    required this.message,
    this.referenceId,
  });

  factory UploadFilePayload.fromJson(Map<String, dynamic> json) =>
      UploadFilePayload(
        fileName: json['fileName'],
        documentId: json['documentId'],
        message: json['message'],
        referenceId: json['referenceId'],
      );
}
