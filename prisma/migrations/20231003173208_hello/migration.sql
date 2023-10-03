/*
  Warnings:

  - You are about to drop the column `brand_id` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `discount_price` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `short_des` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `star` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `stock` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `products` table. All the data in the column will be lost.
  - You are about to alter the column `price` on the `products` table. The data in that column could be lost. The data in that column will be cast from `VarChar(200)` to `VarChar(10)`.
  - Added the required column `img_url` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unit` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products` DROP COLUMN `brand_id`,
    DROP COLUMN `discount_price`,
    DROP COLUMN `image`,
    DROP COLUMN `short_des`,
    DROP COLUMN `star`,
    DROP COLUMN `stock`,
    DROP COLUMN `title`,
    ADD COLUMN `img_url` VARCHAR(100) NOT NULL,
    ADD COLUMN `name` VARCHAR(150) NOT NULL,
    ADD COLUMN `unit` VARCHAR(10) NOT NULL,
    ADD COLUMN `user_id` BIGINT UNSIGNED NOT NULL,
    MODIFY `price` VARCHAR(10) NOT NULL;

-- CreateTable
CREATE TABLE `categories` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
