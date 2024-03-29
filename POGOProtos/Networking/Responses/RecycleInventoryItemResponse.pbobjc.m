// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Networking/Responses/RecycleInventoryItemResponse.proto

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

 #import "POGOProtos/Networking/Responses/RecycleInventoryItemResponse.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - RecycleInventoryItemResponseRoot

@implementation RecycleInventoryItemResponseRoot

@end

#pragma mark - RecycleInventoryItemResponseRoot_FileDescriptor

static GPBFileDescriptor *RecycleInventoryItemResponseRoot_FileDescriptor(void) {
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

#pragma mark - RecycleInventoryItemResponse

@implementation RecycleInventoryItemResponse

@dynamic result;
@dynamic newCount;

typedef struct RecycleInventoryItemResponse__storage_ {
  uint32_t _has_storage_[1];
  RecycleInventoryItemResponse_Result result;
  int32_t newCount;
} RecycleInventoryItemResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "result",
        .dataTypeSpecific.enumDescFunc = RecycleInventoryItemResponse_Result_EnumDescriptor,
        .number = RecycleInventoryItemResponse_FieldNumber_Result,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RecycleInventoryItemResponse__storage_, result),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "newCount",
        .dataTypeSpecific.className = NULL,
        .number = RecycleInventoryItemResponse_FieldNumber_NewCount,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RecycleInventoryItemResponse__storage_, newCount),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RecycleInventoryItemResponse class]
                                     rootClass:[RecycleInventoryItemResponseRoot class]
                                          file:RecycleInventoryItemResponseRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RecycleInventoryItemResponse__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t RecycleInventoryItemResponse_Result_RawValue(RecycleInventoryItemResponse *message) {
  GPBDescriptor *descriptor = [RecycleInventoryItemResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:RecycleInventoryItemResponse_FieldNumber_Result];
  return GPBGetMessageInt32Field(message, field);
}

void SetRecycleInventoryItemResponse_Result_RawValue(RecycleInventoryItemResponse *message, int32_t value) {
  GPBDescriptor *descriptor = [RecycleInventoryItemResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:RecycleInventoryItemResponse_FieldNumber_Result];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum RecycleInventoryItemResponse_Result

GPBEnumDescriptor *RecycleInventoryItemResponse_Result_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "Unset\000Success\000ErrorNotEnoughCopies\000Error"
        "CannotRecycleIncubators\000";
    static const int32_t values[] = {
        RecycleInventoryItemResponse_Result_Unset,
        RecycleInventoryItemResponse_Result_Success,
        RecycleInventoryItemResponse_Result_ErrorNotEnoughCopies,
        RecycleInventoryItemResponse_Result_ErrorCannotRecycleIncubators,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(RecycleInventoryItemResponse_Result)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:RecycleInventoryItemResponse_Result_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL RecycleInventoryItemResponse_Result_IsValidValue(int32_t value__) {
  switch (value__) {
    case RecycleInventoryItemResponse_Result_Unset:
    case RecycleInventoryItemResponse_Result_Success:
    case RecycleInventoryItemResponse_Result_ErrorNotEnoughCopies:
    case RecycleInventoryItemResponse_Result_ErrorCannotRecycleIncubators:
      return YES;
    default:
      return NO;
  }
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
