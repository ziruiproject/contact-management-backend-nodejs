/*
  Warnings:

  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `users` table. All the data in the column will be lost.
  - Added the required column `username` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "contacts" DROP CONSTRAINT "contacts_username_fkey";

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "id",
ADD COLUMN     "username" VARCHAR(100) NOT NULL,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("username");

-- AddForeignKey
ALTER TABLE "contacts" ADD CONSTRAINT "contacts_username_fkey" FOREIGN KEY ("username") REFERENCES "users"("username") ON DELETE RESTRICT ON UPDATE CASCADE;
