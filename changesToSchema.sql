#changes to schema
ALTER TABLE `_tasks_of_users` ADD FOREIGN KEY (`idUser`) REFERENCES `user`(`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;
UPDATE `liste_type_diplomes` SET `id` = '19' WHERE `liste_type_diplomes`.`id` = '7';
UPDATE `liste_type_diplomes` SET `id` = '7' WHERE `liste_type_diplomes`.`id` = '13';
UPDATE `liste_type_diplomes` SET `id` = '13' WHERE `liste_type_diplomes`.`id` = '19';
ALTER TABLE `_job_experience` CHANGE `typedecontrat` `typedecontrat` INT NOT NULL DEFAULT '7';
ALTER TABLE `pretentionssalariales` ADD  FOREIGN KEY (`idUser`) REFERENCES `user`(`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pretentionssalariales` ADD  FOREIGN KEY (`idPositionNom`) REFERENCES `noms_de_metiers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `questionnaires` ADD  FOREIGN KEY (`createdBy`) REFERENCES `user`(`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `userreview` ADD  FOREIGN KEY (`idUser`) REFERENCES `user`(`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `_job_experience` ADD  FOREIGN KEY (`SecteurID`) REFERENCES `secteur_acrivitees`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;