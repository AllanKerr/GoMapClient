// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Networking/Responses/SetContactSettingsResponse.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "POGOProtos/Networking/Responses/SetContactSettingsResponse.pbobjc.h"
 #import "POGOProtos/Data/PlayerData.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - SetContactSettingsResponseRoot

@implementation SetContactSettingsResponseRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[PlayerDataRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - SetContactSettingsResponseRoot_FileDescriptor

static GPBFileDescriptor *SetContactSettingsResponseRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPBDebugCheckRuntimeVersion();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"POGOProtos.Networking.Responses"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - SetContactSettingsResponse

@implementation SetContactSettingsResponse

@dynamic status;
@dynamic hasPlayerData, playerData;

typedef struct SetContactSettingsResponse__storage_ {
  uint32_t _has_storage_[1];
  SetContactSettingsResponse_Status status;
  PlayerData *playerData;
} SetContactSettingsResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = SetContactSettingsResponse_Status_EnumDescriptor,
        .number = SetContactSettingsResponse_FieldNumber_Status,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SetContactSettingsResponse__storage_, status),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "playerData",
        .dataTypeSpecific.className = GPBStringifySymbol(PlayerData),
        .number = SetContactSettingsResponse_FieldNumber_PlayerData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SetContactSettingsResponse__storage_, playerData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SetContactSettingsResponse class]
                                     rootClass:[SetContactSettingsResponseRoot class]
                                          file:SetContactSettingsResponseRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SetContactSettingsResponse__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t SetContactSettingsResponse_Status_RawValue(SetContactSettingsResponse *message) {
  GPBDescriptor *descriptor = [SetContactSettingsResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SetContactSettingsResponse_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetSetContactSettingsResponse_Status_RawValue(SetContactSettingsResponse *message, int32_t value) {
  GPBDescriptor *descriptor = [SetContactSettingsResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SetContactSettingsResponse_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum SetContactSettingsResponse_Status

GPBEnumDescriptor *SetContactSettingsResponse_Status_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "Unset\000Success\000Failure\000";
    static const int32_t values[] = {
        SetContactSettingsResponse_Status_Unset,
        SetContactSettingsResponse_Status_Success,
        SetContactSettingsResponse_Status_Failure,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(SetContactSettingsResponse_Status)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:SetContactSettingsResponse_Status_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL SetContactSettingsResponse_Status_IsValidValue(int32_t value__) {
  switch (value__) {
    case SetContactSettingsResponse_Status_Unset:
    case SetContactSettingsResponse_Status_Success:
    case SetContactSettingsResponse_Status_Failure:
      return YES;
    default:
      return NO;
  }
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)