// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Networking/Responses/SetAvatarResponse.proto

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

 #import "POGOProtos/Networking/Responses/SetAvatarResponse.pbobjc.h"
 #import "POGOProtos/Data/PlayerData.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - SetAvatarResponseRoot

@implementation SetAvatarResponseRoot

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

#pragma mark - SetAvatarResponseRoot_FileDescriptor

static GPBFileDescriptor *SetAvatarResponseRoot_FileDescriptor(void) {
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

#pragma mark - SetAvatarResponse

@implementation SetAvatarResponse

@dynamic status;
@dynamic hasPlayerData, playerData;

typedef struct SetAvatarResponse__storage_ {
  uint32_t _has_storage_[1];
  SetAvatarResponse_Status status;
  PlayerData *playerData;
} SetAvatarResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = SetAvatarResponse_Status_EnumDescriptor,
        .number = SetAvatarResponse_FieldNumber_Status,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(SetAvatarResponse__storage_, status),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "playerData",
        .dataTypeSpecific.className = GPBStringifySymbol(PlayerData),
        .number = SetAvatarResponse_FieldNumber_PlayerData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(SetAvatarResponse__storage_, playerData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[SetAvatarResponse class]
                                     rootClass:[SetAvatarResponseRoot class]
                                          file:SetAvatarResponseRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(SetAvatarResponse__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t SetAvatarResponse_Status_RawValue(SetAvatarResponse *message) {
  GPBDescriptor *descriptor = [SetAvatarResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SetAvatarResponse_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetSetAvatarResponse_Status_RawValue(SetAvatarResponse *message, int32_t value) {
  GPBDescriptor *descriptor = [SetAvatarResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:SetAvatarResponse_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum SetAvatarResponse_Status

GPBEnumDescriptor *SetAvatarResponse_Status_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "Unset\000Success\000AvatarAlreadySet\000Failure\000";
    static const int32_t values[] = {
        SetAvatarResponse_Status_Unset,
        SetAvatarResponse_Status_Success,
        SetAvatarResponse_Status_AvatarAlreadySet,
        SetAvatarResponse_Status_Failure,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(SetAvatarResponse_Status)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:SetAvatarResponse_Status_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL SetAvatarResponse_Status_IsValidValue(int32_t value__) {
  switch (value__) {
    case SetAvatarResponse_Status_Unset:
    case SetAvatarResponse_Status_Success:
    case SetAvatarResponse_Status_AvatarAlreadySet:
    case SetAvatarResponse_Status_Failure:
      return YES;
    default:
      return NO;
  }
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
