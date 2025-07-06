import 'package:flutter/material.dart';
import 'package:pummel_the_fish/data/models/pet.dart';
import 'package:pummel_the_fish/screens/home_screen.dart';
import 'package:pummel_the_fish/widgets/custom_button.dart';

class CreatePetScreen extends StatefulWidget {
  const CreatePetScreen({super.key});

  @override
  State<CreatePetScreen> createState() => _CreatePetScreenState();
}

class _CreatePetScreenState extends State<CreatePetScreen> {
  final _formKey = GlobalKey<FormState>();

  String? currentName;
  int? currentAge;
  double? currentHeigh;
  double? currentWeight;
  Species? currentSepcies;
  bool currentIsFemale = false;

  void _savePet() {
    if (_formKey.currentState?.validate() ?? false) {
      /*
      final pet = Pet(
          id: "test",
          name: currentName!,
          age: currentAge!,
          height: currentHeigh!,
          weight: currentWeight!,
          species: currentSepcies!,
          isFemale: currentIsFemale);
      print(pet);
      */
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Neues Kuscheltier anlegen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (value) {
                      currentName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte geben Sie einen Namen eingeben';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Alter (Jahre)'),
                    onChanged: (value) {
                      currentAge = int.tryParse(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte geben Sie ein Alter eingeben';
                      }
                      final age = int.tryParse(value);
                      if (age == null) {
                        return 'Bitte geben Sie ein gültiges Alter ein';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Höhe (cm)'),
                    onChanged: (value) {
                      currentHeigh = double.tryParse(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte geben Sie eine Höhe eingeben';
                      }
                      final heigh = int.tryParse(value);
                      if (heigh == null) {
                        return 'Bitte geben Sie eine gültige Höhe ein';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Gewicht (Gramm)'),
                    onChanged: (value) {
                      currentWeight = double.tryParse(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte geben Sie ein Gewicht eingeben';
                      }
                      final weight = int.tryParse(value);
                      if (weight == null) {
                        return 'Bitte geben Sie ein gültiges Gewicht ein';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<Species>(
                    hint: const Text('Bitte wählen Sie eine Tierart aus'),
                    items: const [
                      DropdownMenuItem(
                        value: Species.dog,
                        child: Text('Hund'),
                      ),
                      DropdownMenuItem(
                        value: Species.cat,
                        child: Text('Katze'),
                      ),
                      DropdownMenuItem(
                        value: Species.fish,
                        child: Text('Fisch'),
                      ),
                      DropdownMenuItem(
                        value: Species.bird,
                        child: Text('Vogel'),
                      )
                    ],
                    onChanged: (Species? value) {
                      currentSepcies = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Bitte eine Spezies eingeben';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Weiblich'),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 16,
                    ),
                    value: currentIsFemale,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          currentIsFemale = value;
                        });
                      }
                    },
                  ),
                  CustomButton(label: 'Speichern', onPressed: _savePet),
                ],
              )),
        ),
      ),
    );
  }
}
