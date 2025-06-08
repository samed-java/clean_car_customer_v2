import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';

Branch? branchConverted(CampaignWashing? washing) {
  if (washing == null) return null;
  return Branch(
    id: washing.id!,
    washingName: washing.title!,
    address: washing.address!,
    lat: washing.lat!,
    lon: washing.lon!,
  );
}

Service? serviceConverter(CampaignService? service) {
  if (service == null) return null;
  return Service(
    serviceId: service.id!,
    title: service.title!,
    price: service.price!,
    discountedPrice: service.discountedPrice,
  );
}
