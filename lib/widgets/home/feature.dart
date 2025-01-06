import 'package:cognix/constants/features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildFeatureItem(FeatureItem feature, bool isLarge) {
  return InkWell(
    borderRadius: BorderRadius.circular(24),
    onTap: () => Get.toNamed(feature.link),
    child: Container(
      width: double.infinity,
      height: isLarge ? 220 : 106,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: feature.color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(feature.icon, color: Colors.black),
              ),
              Icon(Icons.arrow_outward, color: Colors.black)
            ],
          ),
          Text(
            feature.label,
            style: TextStyle(
              color: Colors.black,
              height: 1.25,
              fontSize: isLarge ? 32 : 16,
              fontWeight: FontWeight.w500,
            ),
            overflow: isLarge ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
