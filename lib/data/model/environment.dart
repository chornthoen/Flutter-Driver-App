import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum EnvironmentType { none, development, staging, production , qa}

class Environment extends Equatable {
  const Environment({
    required this.name,
    required this.baseUrl,
    required this.apiVersion,
    this.type = EnvironmentType.development,
    this.envColor = Colors.transparent,
  });

  final String name;
  final String baseUrl;
  final String apiVersion;
  final EnvironmentType type;
  final Color envColor;

  // empty environment
  static const isEmpty = Environment(
    name: '',
    baseUrl: '',
    apiVersion: '',
    type: EnvironmentType.none,
  );
  // map all environments
  static Map<EnvironmentType, Environment> get values => {
        EnvironmentType.development: const Environment(
          name: 'Dev',
          baseUrl: 'https://dev.example.com',
          apiVersion: 'v1',
          type: EnvironmentType.development,
          envColor: AppColors.kColorRed,
        ),
        EnvironmentType.staging: const Environment(
          name: 'Staging',
          baseUrl: 'https://staging.example.com',
          apiVersion: 'v1',
          type: EnvironmentType.staging,
          envColor: AppColors.kColorOrange,
        ),
        EnvironmentType.production: const Environment(
          name: 'Production',
          baseUrl: 'https://example.com',
          apiVersion: 'v1',
          type: EnvironmentType.production,
          envColor: AppColors.kColorBlue,
        ),
        EnvironmentType.qa: const Environment(
          name: 'QA',
          baseUrl: 'https://qa.example.com',
          apiVersion: 'v1',
          type: EnvironmentType.qa,
          envColor: Colors.redAccent,
        ),
      };

  @override
  List<Object> get props => [name, baseUrl, apiVersion, type, envColor];
}
