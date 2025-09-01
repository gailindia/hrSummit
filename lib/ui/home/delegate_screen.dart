import 'package:flutter/material.dart';
import 'package:hrsummit/data/model/delegates_respModel.dart';
import 'package:hrsummit/state/delegatesModel.dart';
import 'package:hrsummit/ui/widgets/contact_delegate.dart';
import 'package:hrsummit/ui/widgets/homeWidgets.dart'; 
import 'package:hrsummit/utils/header_widget.dart';
import 'package:hrsummit/utils/viewModel.dart';
import 'package:hrsummit/widgets/commonBG.dart';
import 'package:provider/provider.dart';

class DelegateScreen extends StatefulWidget {
  static const String route = '/delegates';
  const DelegateScreen({super.key});

  @override
  State<DelegateScreen> createState() => _DelegateScreenState();
}

  class _DelegateScreenState extends State<DelegateScreen> {
    final TextEditingController _searchController = TextEditingController();
    List<DelegateData> filteredList = [];


    @override
    void initState() {
      withViewModel<DelegatesModel>(context, (viewModel) async {
        viewModel.calldelegApi();
        setState(() {
        filteredList = viewModel.delegRespDto;  
      });
      });
      _searchController.addListener(_onSearchChanged);
      super.initState();
    }


      void _onSearchChanged() {
    final provider = context.read<DelegatesModel>();
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      setState(() {
        filteredList = provider.delegRespDto; // reset full list
      });
    } else {
      setState(() {
        filteredList = provider.delegRespDto
            .where((item) =>
            item.nAME!.toLowerCase().contains(query) ||
            item.dESIGNATION!.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


    
    @override
    Widget build(BuildContext context) {
      return MyAppBackGroundVM<DelegatesModel>(
        child: Consumer<DelegatesModel>(
          builder: (context, provider, child) {
            if(provider.delegRespDto.isEmpty) {
              return Center(child: Text("No delegates found"));
            }
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  HeaderWidget( 
                    ), 
                    CommonAppbar(
                      title: "Delegates",
                      onBack: () {
                        
                      },
                    ),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search delegates...",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                _onSearchChanged(); // reset list
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                  ContactListPage(listDelegate: provider.delegRespDto),
                ],
              ),
      
    );
  })
    );
}
}