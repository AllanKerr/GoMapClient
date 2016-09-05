// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Inventory/Item/ItemData.proto

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

 #import "POGOProtos/Inventory/Item/ItemData.pbobjc.h"
 #import "POGOProtos/Inventory/Item/ItemId.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ItemDataRoot

@implementation ItemDataRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[ItemIdRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - ItemDataRoot_FileDescriptor

static GPBFileDescriptor *ItemDataRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPBDebugCheckRuntimeVersion();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"POGOProtos.Inventory.Item"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - ItemData

@implementation ItemData

@dynamic itemId;
@dynamic count;
@dynamic unseen;

typedef struct ItemData__storage_ {
  uint32_t _has_storage_[1];
  ItemId itemId;
  int32_t count;
} ItemData__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "itemId",
        .dataTypeSpecific.enumDescFunc = ItemId_EnumDescriptor,
        .number = ItemData_FieldNumber_ItemId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ItemData__storage_, itemId),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "count",
        .dataTypeSpecific.className = NULL,
        .number = ItemData_FieldNumber_Count,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ItemData__storage_, count),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "unseen",
        .dataTypeSpecific.className = NULL,
        .number = ItemData_FieldNumber_Unseen,
        .hasIndex = 2,
        .offset = 3,  // Stored in _has_storage_ to save space.
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ItemData class]
                                     rootClass:[ItemDataRoot class]
                                          file:ItemDataRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ItemData__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t ItemData_ItemId_RawValue(ItemData *message) {
  GPBDescriptor *descriptor = [ItemData descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ItemData_FieldNumber_ItemId];
  return GPBGetMessageInt32Field(message, field);
}

void SetItemData_ItemId_RawValue(ItemData *message, int32_t value) {
  GPBDescriptor *descriptor = [ItemData descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ItemData_FieldNumber_ItemId];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)