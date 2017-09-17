set autocommit=on;

copy customer from 's3://awssampledbuswest2/ssbgz/customer' 
iam_role 'arn:aws:iam::<aws-account-id>:role/<role-name>'
gzip region 'us-west-2';

copy dwdate from 's3://awssampledbuswest2/ssbgz/dwdate' 
iam_role 'arn:aws:iam::<aws-account-id>:role/<role-name>'
gzip region 'us-west-2';
