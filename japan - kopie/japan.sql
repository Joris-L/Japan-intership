-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 18 jun 2021 om 15:16
-- Serverversie: 10.4.11-MariaDB
-- PHP-versie: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `japan`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `educational_partners`
--

CREATE TABLE `educational_partners` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `educational_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `interns`
--

CREATE TABLE `interns` (
  `id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `living_country` varchar(100) DEFAULT NULL,
  `graduated` text DEFAULT NULL,
  `student` varchar(255) DEFAULT NULL,
  `native_lang` text DEFAULT NULL,
  `fluent_lang` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `interns`
--

INSERT INTO `interns` (`id`, `user_id`, `fullname`, `email`, `description`, `profile_picture`, `video_link`, `tags`, `nationality`, `living_country`, `graduated`, `student`, `native_lang`, `fluent_lang`) VALUES
(2, 2, 'Jeremy Griffin d', 'libero.Proin@nondapibus.dca', 'eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique dpellentesque, tellus sem mollis dui, in sodales', '', 'dQw4w9WgXcQd', 'mi felis, adipiscing fringilla, pordttitor vulputate, posuere vulputate, lacus.', 'Egypt123', 'Cambodiad', 'odd', 'Yesd', 'egestas. Fusce aliquetd', 'amet luctus vulputate,d'),
(3, 3, 'Maxine Mcneil', 'neque.Morbi.quis@nonummyultricies.edu', 'id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales', '3.jpg', 'dQw4w9WgXcQ', 'aliquet.', 'Cayman Islands', 'French Southern Territories', 'libero et', 'Yes', 'dictum. Phasellus in', 'sed orci lobortis augue scelerisque'),
(4, 4, 'Kelly K. Mendoza', 'elit.elit@interdumenim.org', 'Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus', '4.jpg', 'dQw4w9WgXcQ', 'In nec orci. Donec nibh. Quisque', 'Côte D\'Ivoire (Ivory Coast)', 'Mongolia', 'Cras vehicula aliquet libero. Integer', 'Yes', 'sit amet,', 'quis diam. Pellentesque habitant'),
(5, 5, 'Declan B. Lindsey', 'dui.Cras@vulputate.net', 'feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales', '5.jpg', 'dQw4w9WgXcQ', 'fames ac turpis egestas.', 'China', 'San Marino', 'quis diam. Pellentesque habitant', 'Yes', 'dis', 'hendrerit'),
(6, 6, 'Rahim G. Wagner', 'vel.sapien@Vestibulumut.net', 'velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet', '6.jpg', 'dQw4w9WgXcQ', 'egestas a, dui. Cras', 'Portugal', 'Angola', 'turpis', 'Yes', 'Sed diam lorem, auctor quis,', 'primis in faucibus orci'),
(7, 7, 'Nathaniel P. Hurst', 'quis@faucibusleoin.net', 'vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam', '7.jpg', 'dQw4w9WgXcQ', 'porttitor vulputate, posuere', 'Guinea-Bissau', 'Germany', 'Sed nulla ante, iaculis nec,', 'No', 'arcu. Vestibulum', 'et'),
(8, 8, 'Honorato P. Rasmussen', 'sapien.Cras.dolor@pedeCumsociis.org', 'sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.', '8.jpg', 'dQw4w9WgXcQ', 'primis in', 'French Southern Territories', 'Niue', 'et ipsum cursus', 'Yes', 'facilisis eget, ipsum. Donec', 'et tristique pellentesque,'),
(9, 9, 'Marshall Giles', 'sit@ligula.com', 'Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In', '9.jpg', 'dQw4w9WgXcQ', 'pede ac urna. Ut tincidunt vehicula risus. Nulla eget', 'Seychelles', 'Israel', 'magna.', 'No', 'augue', 'tincidunt, neque'),
(10, 10, 'Rachel Baldwin', 'sem@CuraeDonectincidunt.org', 'volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,', '10.jpg', 'dQw4w9WgXcQ', 'dictum eu, eleifend nec, malesuada ut, sem.', 'Switzerland', 'Peru', 'tempus, lorem fringilla ornare placerat,', 'No', 'est tempor bibendum. Donec', 'sit amet diam eu dolor'),
(11, 11, 'Shelley X. Velazquez', 'gravida.nunc@nec.ca', 'cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit', '11.jpg', 'dQw4w9WgXcQ', 'faucibus. Morbi', 'San Marino', 'China', 'euismod est arcu ac orci.', 'No', 'non arcu.', 'ipsum nunc id'),
(12, 12, 'Scarlett Y. Bruce', 'eget.metus.eu@auctorullamcorper.org', 'volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in', '12.jpg', 'dQw4w9WgXcQ', 'mi felis,', 'Trinidad and Tobago', 'Ghana', 'commodo ipsum.', 'Yes', 'sem. Pellentesque ut ipsum ac', 'risus. Donec'),
(14, 14, 'Steel Garrett', 'Curabitur.dictum@euodioPhasellus.org', 'nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum', '14.jpg', 'dQw4w9WgXcQ', 'Suspendisse ac metus vitae velit egestas', 'Bouvet Island', 'Comoros', 'Duis sit amet diam', 'No', 'arcu. Vestibulum ut eros', 'dictum'),
(15, 15, 'Ira Douglas', 'consectetuer.adipiscing.elit@elitafeugiat.com', 'luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut', '15.jpg', 'dQw4w9WgXcQ', 'lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.', 'Equatorial Guinea', 'China', 'elit pede,', 'Yes', 'luctus aliquet odio. Etiam', 'mauris blandit mattis. Cras eget'),
(16, 16, 'Karly K. Santiago', 'at.augue.id@ornareFusce.ca', 'Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,', '16.jpg', 'dQw4w9WgXcQ', 'lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.', 'Wallis and Futuna', 'New Zealand', 'In', 'Yes', 'diam', 'eleifend non, dapibus rutrum, justo.'),
(17, 17, 'Hilel Jarvis', 'neque.non.quam@lectuspedeultrices.org', 'ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,', '17.jpg', 'dQw4w9WgXcQ', 'egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et', 'French Guiana', 'Indonesia', 'In faucibus. Morbi', 'No', 'dictum', 'ipsum. Donec sollicitudin adipiscing'),
(18, 18, 'Miranda Z. Martinez', 'sapien.Nunc.pulvinar@nonummyultriciesornare.co.uk', 'malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue', '18.jpg', 'dQw4w9WgXcQ', 'ridiculus', 'Zimbabwe', 'El Salvador', 'quis,', 'Yes', 'Cras interdum. Nunc sollicitudin commodo', 'facilisis'),
(19, 19, 'Aline Gilmore', 'est.mauris@estcongue.org', 'mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque.', '19.jpg', 'dQw4w9WgXcQ', 'velit eget laoreet posuere, enim nisl elementum purus, accumsan', 'Andorra', 'Guyana', 'Vestibulum ut', 'No', 'luctus', 'malesuada. Integer id magna'),
(20, 20, 'Bethany Levy', 'vitae.semper.egestas@ligulaDonecluctus.net', 'purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed', '20.jpg', 'dQw4w9WgXcQ', 'quis, tristique ac, eleifend vitae,', 'Bouvet Island', 'Finland', 'tempus non, lacinia at,', 'No', 'et tristique pellentesque, tellus sem', 'lacus. Quisque purus'),
(21, 21, 'Oren Mcgowan', 'eleifend.non@sitamet.co.uk', 'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu', '21.jpg', 'dQw4w9WgXcQ', 'ut, nulla. Cras', 'Cuba', 'Algeria', 'at risus. Nunc', 'Yes', 'tempus, lorem fringilla', 'dignissim magna'),
(22, 22, 'Kaseem E. Hebert', 'Donec.luctus@nisl.ca', 'risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis', '22.jpg', 'dQw4w9WgXcQ', 'fringilla purus mauris a nunc. In at pede.', 'Palestine, State of', 'Brunei', 'Aliquam nec enim.', 'Yes', 'arcu', 'ornare, facilisis eget, ipsum. Donec'),
(23, 23, 'Hamilton K. Howell', 'iaculis.nec.eleifend@adipiscing.com', 'sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,', '23.jpg', 'dQw4w9WgXcQ', 'a,', 'Kazakhstan', 'Cambodia', 'egestas ligula. Nullam', 'No', 'molestie. Sed', 'malesuada'),
(24, 24, 'Rama Wallace', 'euismod@habitant.ca', 'hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna.', '24.jpg', 'dQw4w9WgXcQ', 'Morbi quis urna. Nunc', 'Lithuania', 'Venezuela', 'enim diam vel arcu. Curabitur', 'No', 'ut, molestie', 'eleifend.'),
(25, 25, 'Hakeem W. Obrien', 'molestie.arcu@massaVestibulum.com', 'lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean', '25.jpg', 'dQw4w9WgXcQ', 'in, dolor. Fusce feugiat.', 'Ethiopia', 'Antigua and Barbuda', 'a, malesuada id, erat.', 'Yes', 'et', 'massa rutrum magna. Cras'),
(26, 26, 'Cooper W. Garrett', 'dictum.eu@nonlorem.co.uk', 'egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque', '26.jpg', 'dQw4w9WgXcQ', 'ultricies adipiscing, enim mi tempor lorem, eget mollis lectus', 'Congo, the Democratic Republic of the', 'Greece', 'quis massa. Mauris vestibulum,', 'No', 'aliquet', 'quam'),
(27, 27, 'Cairo D. Emerson', 'tincidunt@imperdietnon.edu', 'commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero', '27.jpg', 'dQw4w9WgXcQ', 'risus. Nunc ac', 'Eritrea', 'Nicaragua', 'arcu. Sed eu', 'Yes', 'sem egestas blandit.', 'Aenean gravida nunc sed pede.'),
(28, 28, 'Brianna Blair', 'arcu.vel@estmollisnon.edu', 'metus. In nec', '28.jpg', 'dQw4w9WgXcQ', 'nisl. Quisque fringilla euismod enim.', 'Trinidad and Tobago', 'Micronesia', 'sapien. Aenean', 'No', 'Vivamus', 'augue ac ipsum.'),
(29, 29, 'Amela Farmer', 'Integer.in.magna@malesuadamalesuadaInteger.ca', 'rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas', '29.jpg', 'dQw4w9WgXcQ', 'orci sem eget massa. Suspendisse eleifend. Cras', 'Greenland', 'Tonga', 'urna et arcu imperdiet ullamcorper.', 'Yes', 'lectus pede, ultrices', 'sollicitudin commodo ipsum. Suspendisse'),
(30, 30, 'Kaseem A. Spence', 'Aenean.egestas.hendrerit@ornare.com', 'vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec', '30.jpg', 'dQw4w9WgXcQ', 'eget, dictum placerat, augue.', 'Virgin Islands, British', 'Tonga', 'diam luctus lobortis. Class', 'No', 'lectus. Nullam suscipit, est ac', 'a,');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`) VALUES
(2, 'ut.lacus.Nulla@ultrices.co.uk', '$2y$10$8wXBa4I/TumJm9GHbjLE4uUHinTFutDKfiz8TKbUfPCAW2hq6tf72', 0);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `educational_partners`
--
ALTER TABLE `educational_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `interns`
--
ALTER TABLE `interns`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `educational_partners`
--
ALTER TABLE `educational_partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `interns`
--
ALTER TABLE `interns`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
