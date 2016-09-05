// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Networking/Responses/RecycleInventoryItemResponse.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_GEN_VERSION != 30001
#error This file was generated by a different version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum RecycleInventoryItemResponse_Result

typedef GPB_ENUM(RecycleInventoryItemResponse_Result) {
  /// Value used if any message's field encounters a value that is not defined
  /// by this enum. The message will also have C functions to get/set the rawValue
  /// of the field.
  RecycleInventoryItemResponse_Result_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  RecycleInventoryItemResponse_Result_Unset = 0,
  RecycleInventoryItemResponse_Result_Success = 1,
  RecycleInventoryItemResponse_Result_ErrorNotEnoughCopies = 2,
  RecycleInventoryItemResponse_Result_ErrorCannotRecycleIncubators = 3,
};

GPBEnumDescriptor *RecycleInventoryItemResponse_Result_EnumDescriptor(void);

/// Checks to see if the given value is defined by the enum or was not known at
/// the time this source was generated.
BOOL RecycleInventoryItemResponse_Result_IsValidValue(int32_t value);

#pragma mark - RecycleInventoryItemResponseRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface RecycleInventoryItemResponseRoot : GPBRootObject
@end

#pragma mark - RecycleInventoryItemResponse

typedef GPB_ENUM(RecycleInventoryItemResponse_FieldNumber) {
  RecycleInventoryItemResponse_FieldNumber_Result = 1,
  RecycleInventoryItemResponse_FieldNumber_NewCount = 2,
};

@interface RecycleInventoryItemResponse : GPBMessage

@property(nonatomic, readwrite) RecycleInventoryItemResponse_Result result;

@property(nonatomic, readwrite) int32_t newCount;

@end

/// Fetches the raw value of a @c RecycleInventoryItemResponse's @c result property, even
/// if the value was not defined by the enum at the time the code was generated.
int32_t RecycleInventoryItemResponse_Result_RawValue(RecycleInventoryItemResponse *message);
/// Sets the raw value of an @c RecycleInventoryItemResponse's @c result property, allowing
/// it to be set to a value that was not defined by the enum at the time the code
/// was generated.
void SetRecycleInventoryItemResponse_Result_RawValue(RecycleInventoryItemResponse *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)