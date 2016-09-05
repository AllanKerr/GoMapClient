// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Settings/Master/GymLevelSettings.proto

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

#pragma mark - GymLevelSettingsRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface GymLevelSettingsRoot : GPBRootObject
@end

#pragma mark - GymLevelSettings

typedef GPB_ENUM(GymLevelSettings_FieldNumber) {
  GymLevelSettings_FieldNumber_RequiredExperienceArray = 1,
  GymLevelSettings_FieldNumber_LeaderSlotsArray = 2,
  GymLevelSettings_FieldNumber_TrainerSlotsArray = 3,
  GymLevelSettings_FieldNumber_SearchRollBonusArray = 4,
};

@interface GymLevelSettings : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *requiredExperienceArray;
/// The number of items in @c requiredExperienceArray without causing the array to be created.
@property(nonatomic, readonly) NSUInteger requiredExperienceArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *leaderSlotsArray;
/// The number of items in @c leaderSlotsArray without causing the array to be created.
@property(nonatomic, readonly) NSUInteger leaderSlotsArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *trainerSlotsArray;
/// The number of items in @c trainerSlotsArray without causing the array to be created.
@property(nonatomic, readonly) NSUInteger trainerSlotsArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *searchRollBonusArray;
/// The number of items in @c searchRollBonusArray without causing the array to be created.
@property(nonatomic, readonly) NSUInteger searchRollBonusArray_Count;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)