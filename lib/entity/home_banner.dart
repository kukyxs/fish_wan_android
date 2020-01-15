class HomeBannerEntity {
    List<HomeBannerDetail> data;
    int errorCode;
    String errorMsg;

    HomeBannerEntity({this.data, this.errorCode, this.errorMsg});

    factory HomeBannerEntity.fromJson(Map<String, dynamic> json) {
        return HomeBannerEntity(
            data: json['data'] != null ? (json['data'] as List).map((i) => HomeBannerDetail.fromJson(i)).toList() : null,
            errorCode: json['errorCode'],
            errorMsg: json['errorMsg'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['errorCode'] = this.errorCode;
        data['errorMsg'] = this.errorMsg;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class HomeBannerDetail {
    String desc;
    int id;
    String imagePath;
    int isVisible;
    int order;
    String title;
    int type;
    String url;

    HomeBannerDetail({this.desc, this.id, this.imagePath, this.isVisible, this.order, this.title, this.type, this.url});

    factory HomeBannerDetail.fromJson(Map<String, dynamic> json) {
        return HomeBannerDetail(
            desc: json['desc'],
            id: json['id'],
            imagePath: json['imagePath'],
            isVisible: json['isVisible'],
            order: json['order'],
            title: json['title'],
            type: json['type'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['desc'] = this.desc;
        data['id'] = this.id;
        data['imagePath'] = this.imagePath;
        data['isVisible'] = this.isVisible;
        data['order'] = this.order;
        data['title'] = this.title;
        data['type'] = this.type;
        data['url'] = this.url;
        return data;
    }
}