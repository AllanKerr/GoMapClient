// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: POGOProtos/Networking/Responses/DownloadItemTemplatesResponse.proto

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

 #import "POGOProtos/Networking/Responses/DownloadItemTemplatesResponse.pbobjc.h"
 #import "POGOProtos/Settings/Master/ItemSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/MoveSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/BadgeSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/PokemonSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/MoveSequenceSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/TypeEffectiveSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/CameraSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/PlayerLevelSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/GymLevelSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/GymBattleSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/EncounterSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/IapItemDisplay.pbobjc.h"
 #import "POGOProtos/Settings/Master/IapSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/PokemonUpgradeSettings.pbobjc.h"
 #import "POGOProtos/Settings/Master/EquippedBadgeSettings.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - DownloadItemTemplatesResponseRoot

@implementation DownloadItemTemplatesResponseRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[ItemSettingsRoot extensionRegistry]];
    [registry addExtensions:[MoveSettingsRoot extensionRegistry]];
    [registry addExtensions:[BadgeSettingsRoot extensionRegistry]];
    [registry addExtensions:[PokemonSettingsRoot extensionRegistry]];
    [registry addExtensions:[MoveSequenceSettingsRoot extensionRegistry]];
    [registry addExtensions:[TypeEffectiveSettingsRoot extensionRegistry]];
    [registry addExtensions:[CameraSettingsRoot extensionRegistry]];
    [registry addExtensions:[PlayerLevelSettingsRoot extensionRegistry]];
    [registry addExtensions:[GymLevelSettingsRoot extensionRegistry]];
    [registry addExtensions:[GymBattleSettingsRoot extensionRegistry]];
    [registry addExtensions:[EncounterSettingsRoot extensionRegistry]];
    [registry addExtensions:[IapItemDisplayRoot extensionRegistry]];
    [registry addExtensions:[IapSettingsRoot extensionRegistry]];
    [registry addExtensions:[PokemonUpgradeSettingsRoot extensionRegistry]];
    [registry addExtensions:[EquippedBadgeSettingsRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - DownloadItemTemplatesResponseRoot_FileDescriptor

static GPBFileDescriptor *DownloadItemTemplatesResponseRoot_FileDescriptor(void) {
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

#pragma mark - DownloadItemTemplatesResponse

@implementation DownloadItemTemplatesResponse

@dynamic success;
@dynamic itemTemplatesArray, itemTemplatesArray_Count;
@dynamic timestampMs;

typedef struct DownloadItemTemplatesResponse__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *itemTemplatesArray;
  uint64_t timestampMs;
} DownloadItemTemplatesResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "success",
        .dataTypeSpecific.className = NULL,
        .number = DownloadItemTemplatesResponse_FieldNumber_Success,
        .hasIndex = 0,
        .offset = 1,  // Stored in _has_storage_ to save space.
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "itemTemplatesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(DownloadItemTemplatesResponse_ItemTemplate),
        .number = DownloadItemTemplatesResponse_FieldNumber_ItemTemplatesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse__storage_, itemTemplatesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "timestampMs",
        .dataTypeSpecific.className = NULL,
        .number = DownloadItemTemplatesResponse_FieldNumber_TimestampMs,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse__storage_, timestampMs),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[DownloadItemTemplatesResponse class]
                                     rootClass:[DownloadItemTemplatesResponseRoot class]
                                          file:DownloadItemTemplatesResponseRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(DownloadItemTemplatesResponse__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - DownloadItemTemplatesResponse_ItemTemplate

@implementation DownloadItemTemplatesResponse_ItemTemplate

@dynamic templateId;
@dynamic hasPokemonSettings, pokemonSettings;
@dynamic hasItemSettings, itemSettings;
@dynamic hasMoveSettings, moveSettings;
@dynamic hasMoveSequenceSettings, moveSequenceSettings;
@dynamic hasTypeEffective, typeEffective;
@dynamic hasBadgeSettings, badgeSettings;
@dynamic hasCamera, camera;
@dynamic hasPlayerLevel, playerLevel;
@dynamic hasGymLevel, gymLevel;
@dynamic hasBattleSettings, battleSettings;
@dynamic hasEncounterSettings, encounterSettings;
@dynamic hasIapItemDisplay, iapItemDisplay;
@dynamic hasIapSettings, iapSettings;
@dynamic hasPokemonUpgrades, pokemonUpgrades;
@dynamic hasEquippedBadges, equippedBadges;

typedef struct DownloadItemTemplatesResponse_ItemTemplate__storage_ {
  uint32_t _has_storage_[1];
  NSString *templateId;
  PokemonSettings *pokemonSettings;
  ItemSettings *itemSettings;
  MoveSettings *moveSettings;
  MoveSequenceSettings *moveSequenceSettings;
  TypeEffectiveSettings *typeEffective;
  BadgeSettings *badgeSettings;
  CameraSettings *camera;
  PlayerLevelSettings *playerLevel;
  GymLevelSettings *gymLevel;
  GymBattleSettings *battleSettings;
  EncounterSettings *encounterSettings;
  IapItemDisplay *iapItemDisplay;
  IapSettings *iapSettings;
  PokemonUpgradeSettings *pokemonUpgrades;
  EquippedBadgeSettings *equippedBadges;
} DownloadItemTemplatesResponse_ItemTemplate__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "templateId",
        .dataTypeSpecific.className = NULL,
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_TemplateId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, templateId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "pokemonSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(PokemonSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_PokemonSettings,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, pokemonSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "itemSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(ItemSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_ItemSettings,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, itemSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "moveSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(MoveSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_MoveSettings,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, moveSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "moveSequenceSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(MoveSequenceSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_MoveSequenceSettings,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, moveSequenceSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "typeEffective",
        .dataTypeSpecific.className = GPBStringifySymbol(TypeEffectiveSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_TypeEffective,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, typeEffective),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "badgeSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(BadgeSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_BadgeSettings,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, badgeSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "camera",
        .dataTypeSpecific.className = GPBStringifySymbol(CameraSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_Camera,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, camera),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "playerLevel",
        .dataTypeSpecific.className = GPBStringifySymbol(PlayerLevelSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_PlayerLevel,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, playerLevel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "gymLevel",
        .dataTypeSpecific.className = GPBStringifySymbol(GymLevelSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_GymLevel,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, gymLevel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "battleSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(GymBattleSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_BattleSettings,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, battleSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "encounterSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(EncounterSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_EncounterSettings,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, encounterSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "iapItemDisplay",
        .dataTypeSpecific.className = GPBStringifySymbol(IapItemDisplay),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_IapItemDisplay,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, iapItemDisplay),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "iapSettings",
        .dataTypeSpecific.className = GPBStringifySymbol(IapSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_IapSettings,
        .hasIndex = 13,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, iapSettings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "pokemonUpgrades",
        .dataTypeSpecific.className = GPBStringifySymbol(PokemonUpgradeSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_PokemonUpgrades,
        .hasIndex = 14,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, pokemonUpgrades),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "equippedBadges",
        .dataTypeSpecific.className = GPBStringifySymbol(EquippedBadgeSettings),
        .number = DownloadItemTemplatesResponse_ItemTemplate_FieldNumber_EquippedBadges,
        .hasIndex = 15,
        .offset = (uint32_t)offsetof(DownloadItemTemplatesResponse_ItemTemplate__storage_, equippedBadges),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[DownloadItemTemplatesResponse_ItemTemplate class]
                                     rootClass:[DownloadItemTemplatesResponseRoot class]
                                          file:DownloadItemTemplatesResponseRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(DownloadItemTemplatesResponse_ItemTemplate__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
