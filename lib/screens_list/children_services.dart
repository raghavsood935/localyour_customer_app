import 'package:app/network_files/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class ChildrenServicesViewArgs{
  final String? serviceName;
  ChildrenServicesViewArgs({this.serviceName});
}

class ChildrenServicesView extends HookWidget {
  final ChildrenServicesViewArgs? args;
  const ChildrenServicesView({Key? key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productLoaded = useState(false);
    // final homeVM = useProvider(homeViewModelProvider);
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      if(!productLoaded.value){
        productLoaded.value = true;
        // userVM.getAllAddress();
        // context.read(homeViewModelProvider).getServiceDetails('${args!.serviceSlug!}', '${args!.locationName!}', '${args!.subLocation!}');
      }
    });
    final isLoading = useProvider(homeViewModelProvider).isLoading;
    final serviceDetails = useProvider(homeViewModelProvider).serviceDetailsModel;
    final seviceFAQ = serviceDetails?.serviceFaqModel ?? [];
    final serviceCategoryDetails = serviceDetails?.categoryModel ?? [];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
      ),
      body: ListView(),
    );
  }
}
