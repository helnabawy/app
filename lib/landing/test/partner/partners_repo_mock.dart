import 'package:qcb/landing/src/screens/partners/models/models.imports.dart';
import 'package:qcb/landing/src/screens/partners/models/partner.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/utilities/utils.imports.dart';

//class to mock partnerRepo by implements it
class MockPartnerRepo implements PartnerRepo {
  @override
  Future<List<Partner>> getPartners({bool refresh = true}) async {
    try {
      List<Partner> partners = List.from(partnersFullList);
      return partners;
    } catch (e) {
      rethrow;
    }
  }

  MockPartnerRepo() {
    updateMockedList();
  }

  void updateMockedList() async {
    partnersFullList = await JsonParser<Partner>().loadJsonData(
        filePath: 'lib/landing/test/partner/responses/partners_full_list.json',
        returnType: ReturnType.List,
        fromJsonFunc: (data) => Partner.fromJson(data)) as List<Partner>;

    List<Partner> tempPartnersSearchForTList = await JsonParser<Partner>().loadJsonData(
        filePath: 'lib/landing/test/partner/responses/partners_search_for_t_list.json',
        returnType: ReturnType.List,
        fromJsonFunc: (data) => Partner.fromJson(data)) as List<Partner>;
    partnersSearchForTList =
        List.from(partnersFullList.where((element) => tempPartnersSearchForTList.any((elm) => element.id == elm.id)));
  }

  static List<Partner> partnersFullList = [];
  static List<Partner> partnersSearchForTList = [];
}
