USE YouTube;

insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('braraty0@java.com', 'FxUwDn', 'Brodie', '2021-12-26', 'Male', 'Indonesia', 35648);
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('bdimmock1@alibaba.com', '7LCeB7Kky0ON', 'Bronnie', '2022-2-6', 'Male', 'Pakistan', '40231');
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('ngrunguer2@timesonline.co.uk', 'ehxH4LKLEq', 'Nomi', '2022-2-4', 'Genderfluid', 'Russia', '397355');
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('eniles3@house.gov', 'jnDM7ZXz', 'Emilee', '2021-7-7', 'Polygender', 'Lithuania', '70065');
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('edowling4@weather.com', 'aB8HooN1wh', 'Estella', '2021-2-12', 'Female', 'Indonesia', 23497);
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('qcalleja5@mayoclinic.com', 'g0YfVjvs', 'Querida', '2022-9-1', 'Female', 'Slovenia', '5270');
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('eparkman6@yellowbook.com', 'KT6wv3eUEQ', 'Early', '2021-8-8', 'Male', 'Palestinian Territory', 52138);
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('tfegan7@wordpress.com', 'MHnYctnz', 'Tanner', '2022-5-5', 'Male', 'Colombia', '630008');
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('coliddy8@flickr.com', 'oqD9yBLcMo', 'Clo', '2022-8-21', 'Female', 'France', '13853');
insert into User (Email, Password, UserName, DateOfBirth, Gender, Country, PostalCode) values ('dpennycord9@mit.edu', 'u50ccV5pyvV', 'Delila', '2021-11-1', 'Female', 'France', '20414');

insert into VideoStatus (StatusName) values ('Public');
insert into VideoStatus (StatusName) values ('Hidden');
insert into VideoStatus (StatusName) values ('Private');

insert into Channel (ChannelName, CreationDate) values ('Canal 1', '2021-1-1');
UPDATE User u SET  Channel_Channel_id=1 WHERE u.UserName='Delila';
insert into Channel (ChannelName, CreationDate) values ('Canal 2', '2021-5-12');
UPDATE User u SET  Channel_Channel_id=2 WHERE u.UserName='Clo';
insert into Channel (ChannelName, CreationDate) values ('Canal 3', '2021-8-3');
UPDATE User u SET  Channel_Channel_id=3 WHERE u.UserName='Tanner';

insert into Suscriptions values (1, 1);
insert into Suscriptions values (3, 1);
insert into Suscriptions values (6, 1);
insert into Suscriptions values (8, 2);
insert into Suscriptions values (5, 3);

insert into Video (Description, Size, FileName, DurationMinutes, PublicationDateTime, VideoStatus_VideoStatus_id, Channel_Channel_id) values ('Video 1', '350MB', 'Video 1', 35, '2022-1-5', 1, 1);
insert into Video (Description, Size, FileName, DurationMinutes, PublicationDateTime, VideoStatus_VideoStatus_id, Channel_Channel_id) values ('Video 2', '480MB', 'Video 2', 35, '2022-1-8', 2, 1);
insert into Video (Description, Size, FileName, DurationMinutes, PublicationDateTime, VideoStatus_VideoStatus_id, Channel_Channel_id) values ('Video 3', '650MB', 'Video 3', 35, '2022-1-12', 3, 2);
insert into Video (Description, Size, FileName, DurationMinutes, PublicationDateTime, VideoStatus_VideoStatus_id, Channel_Channel_id) values ('Video 4', '1058MB', 'Video 4', 35, '2022-2-5', 2, 3);
insert into Video (Description, Size, FileName, DurationMinutes, PublicationDateTime, VideoStatus_VideoStatus_id, Channel_Channel_id) values ('Video 5', '680MB', 'Video 5', 35, '2022-2-16', 1, 3);

insert into Label (LabelName) values ('Family Friendly');
insert into Label (LabelName) values ('Suspicious');
insert into Label (LabelName) values ('Make up');
insert into Label (LabelName) values ('Games');
insert into Label (LabelName) values ('Cooking');

insert into LabelVideo values (1, 1);
insert into LabelVideo values (3, 1);
insert into LabelVideo values (2, 2);
insert into LabelVideo values (4, 3);
insert into LabelVideo values (5, 4);

insert into VideoLikesDislikes values (1, 1, 'Like', '2022-8-16');
insert into VideoLikesDislikes values (6, 3, 'Like', '2022-8-16');
insert into VideoLikesDislikes values (3, 5, 'Like', '2022-8-16');

insert into PlayList (PlayListName, CreationDate, PrivateOrPublic, User_User_id) values ('playlist 1', '2022-07-25', 'public', 6);
insert into PlayList (PlayListName, CreationDate, PrivateOrPublic, User_User_id) values ('playlist 2', '2022-07-25', 'private', 2);

insert into PlayListVideo values (1, 3);
insert into PlayListVideo values (1, 4);
insert into PlayListVideo values (1, 5);
insert into PlayListVideo values (2, 1);
insert into PlayListVideo values (2, 5);

insert into Comments (Text, PublicationDate, User_User_id, Video_Video_id) values ('Comentari 1', '2022-11-05', 4, 1);
insert into Comments (Text, PublicationDate, User_User_id, Video_Video_id) values ('Comentari 2', '2022-12-06', 2, 4);
insert into Comments (Text, PublicationDate, User_User_id, Video_Video_id) values ('Comentari 3', '2022-10-25', 7, 2);

insert into CommentsLikesDislikes values (1, 1, 'Like', '2022-11-06');
insert into CommentsLikesDislikes values (5, 2, 'Dislike', '2022-11-06');

