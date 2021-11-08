/*

import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:flutter/material.dart';


/// Drop down for Task Difficulty
class DropDownTaskDifficulty extends StatelessWidget {
  final String labelText;
  final TaskDifficultyEntity selectedEntity;
  final List<TaskDifficultyEntity> listEntities;
  final Function function;

  DropDownTaskDifficulty({this.labelText, this.selectedEntity, this.listEntities, this.function});

  Widget build(BuildContext context) {
    return DropdownButtonFormField<TaskDifficultyEntity>(
      validator: (value) {
        if (value == null) {
          return labelText + " is required.";
        } else {
          return null;
        }
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((TaskDifficultyEntity label) =>
          DropdownMenuItem<TaskDifficultyEntity>(
            value: label,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    label.difficultyDescription + " - " + label.manaPoints.toString() + " coins",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: UIThemeColors.TEXT_COLOR1,
                    ),
                  ),
                )
              ],
            ),
          ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

class DropDownModeOfClaim extends StatelessWidget {
  final String labelText;
  final ModeOfClaimEntity selectedEntity;
  final List<ModeOfClaimEntity> listEntities;
  final Function function;

  DropDownModeOfClaim({this.labelText, this.selectedEntity, this.listEntities, this.function});

  Widget build(BuildContext context) {
    return DropdownButtonFormField<ModeOfClaimEntity>(
      validator: (value) {
        if (value == null) {
          return labelText + " is required.";
        } else {
          return null;
        }
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((ModeOfClaimEntity label) =>
          DropdownMenuItem<ModeOfClaimEntity>(
            value: label,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    label.modeDescription,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: UIThemeColors.TEXT_COLOR1,
                    ),
                  ),
                )
              ],
            ),
          ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

*/
/*

/// Dropdown for Marital Status
class DropDownSelectMaritalStatus extends StatelessWidget {
  final String labelText;
  final ReferenceValueEntity selectedEntity;
  final List<ReferenceValueEntity> listEntities;
  final Function function;

  DropDownSelectMaritalStatus(
      {this.labelText, this.selectedEntity, this.listEntities, this.function});

  Widget build(BuildContext context) {
    return DropdownButtonFormField<ReferenceValueEntity>(
      validator: (value) {
        if (value == null) {
          return labelText + " is required.";
        } else {
          return null;
        }
      },
      isExpanded: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((ReferenceValueEntity label) => DropdownMenuItem<ReferenceValueEntity>(
                value: label,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        label.refDescription,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}

/// Dropdown for Valid ID Type
class DropDownSelectValidIdType extends StatelessWidget {
  final String labelText;
  final ReferenceValueEntity selectedEntity;
  final List<ReferenceValueEntity> listEntities;
  final Function function;

  DropDownSelectValidIdType({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<ReferenceValueEntity>(
      validator: (value) {
        if (value == null) {
          return labelText + " is required.";
        } else {
          return null;
        }
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((ReferenceValueEntity label) => DropdownMenuItem<ReferenceValueEntity>(
                value: label,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        label.refDescription,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Generic ReferenceValueEntity Object
class DropDownSelectField extends StatelessWidget {
  final String labelText;
  final ReferenceValueEntity selectedEntity;
  final List<ReferenceValueEntity> listEntities;
  final Function function;
  final bool isValidated;

  DropDownSelectField({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<ReferenceValueEntity>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((ReferenceValueEntity label) => DropdownMenuItem<ReferenceValueEntity>(
                value: label,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        label.refValue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Business Category Object
class DropDownBusinessCategory extends StatelessWidget {
  final String labelText;
  final IronCoinBusinessCategory selectedEntity;
  final List<IronCoinBusinessCategory> listEntities;
  final Function function;
  final bool isValidated;

  DropDownBusinessCategory({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinBusinessCategory>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinBusinessCategory label) => DropdownMenuItem<IronCoinBusinessCategory>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.description,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Business Category Object
class DropDownBusinessNature extends StatelessWidget {
  final String labelText;
  final IronCoinBusinessNature selectedEntity;
  final List<IronCoinBusinessNature> listEntities;
  final Function function;
  final bool isValidated;

  DropDownBusinessNature({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinBusinessNature>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinBusinessNature label) => DropdownMenuItem<IronCoinBusinessNature>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.description,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Province Object
class DropDownProvince extends StatelessWidget {
  final String labelText;
  final IronCoinProvince selectedEntity;
  final List<IronCoinProvince> listEntities;
  final Function function;
  final bool isValidated;

  DropDownProvince({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinProvince>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinProvince label) => DropdownMenuItem<IronCoinProvince>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.stateName,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Municipality Object
class DropDownCity extends StatelessWidget {
  final String labelText;
  final IronCoinCity selectedEntity;
  final List<IronCoinCity> listEntities;
  final Function function;
  final bool isValidated;

  DropDownCity({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinCity>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinCity label) => DropdownMenuItem<IronCoinCity>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.cityName,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Barangay Object
class DropDownBarangay extends StatelessWidget {
  final String labelText;
  final IronCoinBarangay selectedEntity;
  final List<IronCoinBarangay> listEntities;
  final Function function;
  final bool isValidated;

  DropDownBarangay({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinBarangay>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinBarangay label) => DropdownMenuItem<IronCoinBarangay>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.brgyDesc,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Zipcode Object
class DropDownZipcode extends StatelessWidget {
  final String labelText;
  final IronCoinZipcode selectedEntity;
  final List<IronCoinZipcode> listEntities;
  final Function function;
  final bool isValidated;

  DropDownZipcode({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinZipcode>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinZipcode label) => DropdownMenuItem<IronCoinZipcode>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.zipCode.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for ProductName Object
class DropDownProductName extends StatelessWidget {
  final String labelText;
  final IronCoinProductName selectedEntity;
  final List<IronCoinProductName> listEntities;
  final Function function;
  final bool isValidated;

  DropDownProductName({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinProductName>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinProductName label) => DropdownMenuItem<IronCoinProductName>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.description,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for ProductName Object
class DropDownOccupationCategory extends StatelessWidget {
  final String labelText;
  final IronCoinOccupationCategory selectedEntity;
  final List<IronCoinOccupationCategory> listEntities;
  final Function function;
  final bool isValidated;

  DropDownOccupationCategory({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinOccupationCategory>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinOccupationCategory label) => DropdownMenuItem<IronCoinOccupationCategory>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.description,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for ProductName Object
class DropDownOccupation extends StatelessWidget {
  final String labelText;
  final IronCoinOccupation selectedEntity;
  final List<IronCoinOccupation> listEntities;
  final Function function;
  final bool isValidated;

  DropDownOccupation({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinOccupation>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinOccupation label) => DropdownMenuItem<IronCoinOccupation>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.description,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Zoloz ID
class DropDownZolozID extends StatelessWidget {
  final String labelText;
  final ZolozIDEntity selectedEntity;
  final List<ZolozIDEntity> listEntities;
  final Function function;
  final bool isValidated;

  DropDownZolozID({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<ZolozIDEntity>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((ZolozIDEntity label) => DropdownMenuItem<ZolozIDEntity>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.idType,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Payment and Bank in Loan Page
class DropDownPaymentBank extends StatelessWidget {
  final String labelText;
  final PaymentBankEntity selectedEntity;
  final List<PaymentBankEntity> listEntities;
  final Function function;
  final bool isValidated;

  DropDownPaymentBank({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<PaymentBankEntity>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((PaymentBankEntity label) => DropdownMenuItem<PaymentBankEntity>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.value,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}

/// Dropdown for Bank Disbursement
class DropDownBankDisbursement extends StatelessWidget {
  final String labelText;
  final IronCoinBankEntity selectedEntity;
  final List<IronCoinBankEntity> listEntities;
  final Function function;
  final bool isValidated;

  DropDownBankDisbursement({
    this.labelText,
    this.selectedEntity,
    this.listEntities,
    this.function,
    this.isValidated = true,
  });

  Widget build(BuildContext context) {
    return DropdownButtonFormField<IronCoinBankEntity>(
      validator: (value) {
        if (isValidated) {
          if (value == null) {
            return labelText + " is required.";
          } else {
            return null;
          }
        }
        return null;
      },
      isExpanded: true,
      value: selectedEntity,
      onChanged: function,
      items: listEntities
          .map((IronCoinBankEntity label) => DropdownMenuItem<IronCoinBankEntity>(
        value: label,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label.bankName,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ))
          .toList(),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
                color: Colors.grey[400], width: 1.0, style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            )),
      ),
    );
  }
}*/