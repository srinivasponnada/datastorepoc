/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ServiceRequest type in your schema. */
@immutable
class ServiceRequest extends Model {
  static const classType = const _ServiceRequestModelType();
  final String id;
  final String? _serviceRequestID;
  final String? _Summary;
  final String? _Instructions;
  final String? _customerFirst;
  final String? _customerLast;
  final String? _propertyAddress;
  final String? _propertyCity;
  final String? _propertyState;
  final String? _propertyZip;
  final TemporalDateTime? _appointmentStartLocalTime;
  final TemporalDateTime? _appointmentEndLocalTime;
  final String? _dispatchedBy;
  final double? _quotedRate;
  final String? _clientName;
  final String? _customerMobilePhone;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get serviceRequestID {
    return _serviceRequestID;
  }
  
  String? get Summary {
    return _Summary;
  }
  
  String? get Instructions {
    return _Instructions;
  }
  
  String? get customerFirst {
    return _customerFirst;
  }
  
  String? get customerLast {
    return _customerLast;
  }
  
  String? get propertyAddress {
    return _propertyAddress;
  }
  
  String? get propertyCity {
    return _propertyCity;
  }
  
  String? get propertyState {
    return _propertyState;
  }
  
  String? get propertyZip {
    return _propertyZip;
  }
  
  TemporalDateTime? get appointmentStartLocalTime {
    return _appointmentStartLocalTime;
  }
  
  TemporalDateTime? get appointmentEndLocalTime {
    return _appointmentEndLocalTime;
  }
  
  String? get dispatchedBy {
    return _dispatchedBy;
  }
  
  double? get quotedRate {
    return _quotedRate;
  }
  
  String? get clientName {
    return _clientName;
  }
  
  String? get customerMobilePhone {
    return _customerMobilePhone;
  }
  
  const ServiceRequest._internal({required this.id, serviceRequestID, Summary, Instructions, customerFirst, customerLast, propertyAddress, propertyCity, propertyState, propertyZip, appointmentStartLocalTime, appointmentEndLocalTime, dispatchedBy, quotedRate, clientName, customerMobilePhone}): _serviceRequestID = serviceRequestID, _Summary = Summary, _Instructions = Instructions, _customerFirst = customerFirst, _customerLast = customerLast, _propertyAddress = propertyAddress, _propertyCity = propertyCity, _propertyState = propertyState, _propertyZip = propertyZip, _appointmentStartLocalTime = appointmentStartLocalTime, _appointmentEndLocalTime = appointmentEndLocalTime, _dispatchedBy = dispatchedBy, _quotedRate = quotedRate, _clientName = clientName, _customerMobilePhone = customerMobilePhone;
  
  factory ServiceRequest({String? id, String? serviceRequestID, String? Summary, String? Instructions, String? customerFirst, String? customerLast, String? propertyAddress, String? propertyCity, String? propertyState, String? propertyZip, TemporalDateTime? appointmentStartLocalTime, TemporalDateTime? appointmentEndLocalTime, String? dispatchedBy, double? quotedRate, String? clientName, String? customerMobilePhone}) {
    return ServiceRequest._internal(
      id: id == null ? UUID.getUUID() : id,
      serviceRequestID: serviceRequestID,
      Summary: Summary,
      Instructions: Instructions,
      customerFirst: customerFirst,
      customerLast: customerLast,
      propertyAddress: propertyAddress,
      propertyCity: propertyCity,
      propertyState: propertyState,
      propertyZip: propertyZip,
      appointmentStartLocalTime: appointmentStartLocalTime,
      appointmentEndLocalTime: appointmentEndLocalTime,
      dispatchedBy: dispatchedBy,
      quotedRate: quotedRate,
      clientName: clientName,
      customerMobilePhone: customerMobilePhone);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceRequest &&
      id == other.id &&
      _serviceRequestID == other._serviceRequestID &&
      _Summary == other._Summary &&
      _Instructions == other._Instructions &&
      _customerFirst == other._customerFirst &&
      _customerLast == other._customerLast &&
      _propertyAddress == other._propertyAddress &&
      _propertyCity == other._propertyCity &&
      _propertyState == other._propertyState &&
      _propertyZip == other._propertyZip &&
      _appointmentStartLocalTime == other._appointmentStartLocalTime &&
      _appointmentEndLocalTime == other._appointmentEndLocalTime &&
      _dispatchedBy == other._dispatchedBy &&
      _quotedRate == other._quotedRate &&
      _clientName == other._clientName &&
      _customerMobilePhone == other._customerMobilePhone;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServiceRequest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("serviceRequestID=" + "$_serviceRequestID" + ", ");
    buffer.write("Summary=" + "$_Summary" + ", ");
    buffer.write("Instructions=" + "$_Instructions" + ", ");
    buffer.write("customerFirst=" + "$_customerFirst" + ", ");
    buffer.write("customerLast=" + "$_customerLast" + ", ");
    buffer.write("propertyAddress=" + "$_propertyAddress" + ", ");
    buffer.write("propertyCity=" + "$_propertyCity" + ", ");
    buffer.write("propertyState=" + "$_propertyState" + ", ");
    buffer.write("propertyZip=" + "$_propertyZip" + ", ");
    buffer.write("appointmentStartLocalTime=" + (_appointmentStartLocalTime != null ? _appointmentStartLocalTime!.format() : "null") + ", ");
    buffer.write("appointmentEndLocalTime=" + (_appointmentEndLocalTime != null ? _appointmentEndLocalTime!.format() : "null") + ", ");
    buffer.write("dispatchedBy=" + "$_dispatchedBy" + ", ");
    buffer.write("quotedRate=" + (_quotedRate != null ? _quotedRate!.toString() : "null") + ", ");
    buffer.write("clientName=" + "$_clientName" + ", ");
    buffer.write("customerMobilePhone=" + "$_customerMobilePhone");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServiceRequest copyWith({String? id, String? serviceRequestID, String? Summary, String? Instructions, String? customerFirst, String? customerLast, String? propertyAddress, String? propertyCity, String? propertyState, String? propertyZip, TemporalDateTime? appointmentStartLocalTime, TemporalDateTime? appointmentEndLocalTime, String? dispatchedBy, double? quotedRate, String? clientName, String? customerMobilePhone}) {
    return ServiceRequest(
      id: id ?? this.id,
      serviceRequestID: serviceRequestID ?? this.serviceRequestID,
      Summary: Summary ?? this.Summary,
      Instructions: Instructions ?? this.Instructions,
      customerFirst: customerFirst ?? this.customerFirst,
      customerLast: customerLast ?? this.customerLast,
      propertyAddress: propertyAddress ?? this.propertyAddress,
      propertyCity: propertyCity ?? this.propertyCity,
      propertyState: propertyState ?? this.propertyState,
      propertyZip: propertyZip ?? this.propertyZip,
      appointmentStartLocalTime: appointmentStartLocalTime ?? this.appointmentStartLocalTime,
      appointmentEndLocalTime: appointmentEndLocalTime ?? this.appointmentEndLocalTime,
      dispatchedBy: dispatchedBy ?? this.dispatchedBy,
      quotedRate: quotedRate ?? this.quotedRate,
      clientName: clientName ?? this.clientName,
      customerMobilePhone: customerMobilePhone ?? this.customerMobilePhone);
  }
  
  ServiceRequest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _serviceRequestID = json['serviceRequestID'],
      _Summary = json['Summary'],
      _Instructions = json['Instructions'],
      _customerFirst = json['customerFirst'],
      _customerLast = json['customerLast'],
      _propertyAddress = json['propertyAddress'],
      _propertyCity = json['propertyCity'],
      _propertyState = json['propertyState'],
      _propertyZip = json['propertyZip'],
      _appointmentStartLocalTime = json['appointmentStartLocalTime'] != null ? TemporalDateTime.fromString(json['appointmentStartLocalTime']) : null,
      _appointmentEndLocalTime = json['appointmentEndLocalTime'] != null ? TemporalDateTime.fromString(json['appointmentEndLocalTime']) : null,
      _dispatchedBy = json['dispatchedBy'],
      _quotedRate = (json['quotedRate'] as num?)?.toDouble(),
      _clientName = json['clientName'],
      _customerMobilePhone = json['customerMobilePhone'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'serviceRequestID': _serviceRequestID, 'Summary': _Summary, 'Instructions': _Instructions, 'customerFirst': _customerFirst, 'customerLast': _customerLast, 'propertyAddress': _propertyAddress, 'propertyCity': _propertyCity, 'propertyState': _propertyState, 'propertyZip': _propertyZip, 'appointmentStartLocalTime': _appointmentStartLocalTime?.format(), 'appointmentEndLocalTime': _appointmentEndLocalTime?.format(), 'dispatchedBy': _dispatchedBy, 'quotedRate': _quotedRate, 'clientName': _clientName, 'customerMobilePhone': _customerMobilePhone
  };

  static final QueryField ID = QueryField(fieldName: "serviceRequest.id");
  static final QueryField SERVICEREQUESTID = QueryField(fieldName: "serviceRequestID");
  static final QueryField SUMMARY = QueryField(fieldName: "Summary");
  static final QueryField INSTRUCTIONS = QueryField(fieldName: "Instructions");
  static final QueryField CUSTOMERFIRST = QueryField(fieldName: "customerFirst");
  static final QueryField CUSTOMERLAST = QueryField(fieldName: "customerLast");
  static final QueryField PROPERTYADDRESS = QueryField(fieldName: "propertyAddress");
  static final QueryField PROPERTYCITY = QueryField(fieldName: "propertyCity");
  static final QueryField PROPERTYSTATE = QueryField(fieldName: "propertyState");
  static final QueryField PROPERTYZIP = QueryField(fieldName: "propertyZip");
  static final QueryField APPOINTMENTSTARTLOCALTIME = QueryField(fieldName: "appointmentStartLocalTime");
  static final QueryField APPOINTMENTENDLOCALTIME = QueryField(fieldName: "appointmentEndLocalTime");
  static final QueryField DISPATCHEDBY = QueryField(fieldName: "dispatchedBy");
  static final QueryField QUOTEDRATE = QueryField(fieldName: "quotedRate");
  static final QueryField CLIENTNAME = QueryField(fieldName: "clientName");
  static final QueryField CUSTOMERMOBILEPHONE = QueryField(fieldName: "customerMobilePhone");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServiceRequest";
    modelSchemaDefinition.pluralName = "ServiceRequests";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.SERVICEREQUESTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.SUMMARY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.INSTRUCTIONS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.CUSTOMERFIRST,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.CUSTOMERLAST,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.PROPERTYADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.PROPERTYCITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.PROPERTYSTATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.PROPERTYZIP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.APPOINTMENTSTARTLOCALTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.APPOINTMENTENDLOCALTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.DISPATCHEDBY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.QUOTEDRATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.CLIENTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceRequest.CUSTOMERMOBILEPHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ServiceRequestModelType extends ModelType<ServiceRequest> {
  const _ServiceRequestModelType();
  
  @override
  ServiceRequest fromJson(Map<String, dynamic> jsonData) {
    return ServiceRequest.fromJson(jsonData);
  }
}