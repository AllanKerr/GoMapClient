// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/GoMap/PlayerActivityLog.proto

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

 #import "POGOProtos/GoMap/PlayerActivityLog.pbobjc.h"
 #import "POGOProtos/GoMap/GymActivityType.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PlayerActivityLogRoot

@implementation PlayerActivityLogRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[GymActivityTypeRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - PlayerActivityLogRoot_FileDescriptor

static GPBFileDescriptor *PlayerActivityLogRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPBDebugCheckRuntimeVersion();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"POGOProtos.GoMap"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - PlayerActivityLog

@implementation PlayerActivityLog

@dynamic timestamp;
@dynamic gymId;
@dynamic type;

typedef struct PlayerActivityLog__storage_ {
  uint32_t _has_storage_[1];
  GymActivityType type;
  NSString *gymId;
  uint64_t timestamp;
} PlayerActivityLog__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "timestamp",
        .dataTypeSpecific.className = NULL,
        .number = PlayerActivityLog_FieldNumber_Timestamp,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PlayerActivityLog__storage_, timestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt64,
      },
      {
        .name = "gymId",
        .dataTypeSpecific.className = NULL,
        .number = PlayerActivityLog_FieldNumber_GymId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PlayerActivityLog__storage_, gymId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = GymActivityType_EnumDescriptor,
        .number = PlayerActivityLog_FieldNumber_Type,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PlayerActivityLog__storage_, type),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PlayerActivityLog class]
                                     rootClass:[PlayerActivityLogRoot class]
                                          file:PlayerActivityLogRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PlayerActivityLog__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PlayerActivityLog_Type_RawValue(PlayerActivityLog *message) {
  GPBDescriptor *descriptor = [PlayerActivityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PlayerActivityLog_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetPlayerActivityLog_Type_RawValue(PlayerActivityLog *message, int32_t value) {
  GPBDescriptor *descriptor = [PlayerActivityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PlayerActivityLog_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)