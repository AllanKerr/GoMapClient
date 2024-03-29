// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Data/Player/PlayerAvatar.proto

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

 #import "POGOProtos/Data/Player/PlayerAvatar.pbobjc.h"
 #import "POGOProtos/Enums/Gender.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PlayerAvatarRoot

@implementation PlayerAvatarRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[GenderRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - PlayerAvatarRoot_FileDescriptor

static GPBFileDescriptor *PlayerAvatarRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPBDebugCheckRuntimeVersion();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"POGOProtos.Data.Player"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - PlayerAvatar

@implementation PlayerAvatar

@dynamic skin;
@dynamic hair;
@dynamic shirt;
@dynamic pants;
@dynamic hat;
@dynamic shoes;
@dynamic gender;
@dynamic eyes;
@dynamic backpack;

typedef struct PlayerAvatar__storage_ {
  uint32_t _has_storage_[1];
  int32_t skin;
  int32_t hair;
  int32_t shirt;
  int32_t pants;
  int32_t hat;
  int32_t shoes;
  Gender gender;
  int32_t eyes;
  int32_t backpack;
} PlayerAvatar__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "skin",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Skin,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, skin),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "hair",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Hair,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, hair),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "shirt",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Shirt,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, shirt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "pants",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Pants,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, pants),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "hat",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Hat,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, hat),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "shoes",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Shoes,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, shoes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "gender",
        .dataTypeSpecific.enumDescFunc = Gender_EnumDescriptor,
        .number = PlayerAvatar_FieldNumber_Gender,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, gender),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "eyes",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Eyes,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, eyes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "backpack",
        .dataTypeSpecific.className = NULL,
        .number = PlayerAvatar_FieldNumber_Backpack,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PlayerAvatar__storage_, backpack),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PlayerAvatar class]
                                     rootClass:[PlayerAvatarRoot class]
                                          file:PlayerAvatarRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PlayerAvatar__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PlayerAvatar_Gender_RawValue(PlayerAvatar *message) {
  GPBDescriptor *descriptor = [PlayerAvatar descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PlayerAvatar_FieldNumber_Gender];
  return GPBGetMessageInt32Field(message, field);
}

void SetPlayerAvatar_Gender_RawValue(PlayerAvatar *message, int32_t value) {
  GPBDescriptor *descriptor = [PlayerAvatar descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PlayerAvatar_FieldNumber_Gender];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
