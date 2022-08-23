import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  // const SettingsScreen({Key? key}) : super(key: key);

  static const routeName='/settings-screen';
  final Map<String, bool> filters;
  final Function saveSettings;

  SettingsScreen(this.filters, this.saveSettings);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree= false;
  var _vegetarian= false;
  var _vegan= false;
  var _lactoseFree= false;

  @override
  initState(){
    _glutenFree=widget.filters['gluten'];
    _lactoseFree=widget.filters['lactose'];
    _vegan=widget.filters['vegan'];
    _vegetarian=widget.filters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue){
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Settings'),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                final selectedSettings={
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian':_vegetarian,
                };
                widget.saveSettings(selectedSettings);
                },
              icon: Icon(Icons.save)
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Gluten-Free',
                  'It does not contain Gluten',
                  _glutenFree,
                  (newValue){
                    setState(() {
                      _glutenFree=newValue;
                    });
                  }),
              _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                      (newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                  }),
              _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                 _vegan,
                      (newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  }),
              _buildSwitchListTile(
                  'Lactose-Free',
                  'Only meals that does not contain Lactose',
                  _lactoseFree,
                      (newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  })
            ],
          ))
        ],
      )
    );
  }
}
