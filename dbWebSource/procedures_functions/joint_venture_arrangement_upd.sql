

CREATE PROCEDURE [dbo].[joint_venture_arrangement_upd]
(
    @tt    joint_venture_arrangement_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,joint_venture_partner					= b.joint_venture_partner
			,joint_venture_leader					= b.joint_venture_leader
			,joint_venture_board_members			= b.joint_venture_board_members
			,joint_venture_board_alternative_member	= b.joint_venture_board_alternative_member
			,joint_venture_shares					= b.joint_venture_shares
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.joint_venture_arrangement a INNER JOIN @tt b
        ON a.joint_venture_arrangement_id = b.joint_venture_arrangement_id 
       WHERE (
				isnull(a.contract_particular_id,0)						<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.joint_venture_partner,'')						<> isnull(b.joint_venture_partner,'') 
			OR	isnull(a.joint_venture_leader,'')						<> isnull(b.joint_venture_leader,'')
			OR	isnull(a.joint_venture_board_members,'')				<> isnull(b.joint_venture_board_members,'') 
			OR	isnull(a.joint_venture_board_alternative_member,'')		<> isnull(b.joint_venture_board_alternative_member,'') 
			OR	isnull(a.joint_venture_shares,'')						<> isnull(b.joint_venture_shares,'') 
	   )
	   
-- Insert Process

    INSERT INTO joint_venture_arrangement (
		 contract_particular_id
	    ,joint_venture_partner
        ,joint_venture_leader	
		,joint_venture_board_members	
		,joint_venture_board_alternative_member
		,joint_venture_shares
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
	    ,joint_venture_partner
        ,joint_venture_leader	
		,joint_venture_board_members	
		,joint_venture_board_alternative_member
		,joint_venture_shares	
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE joint_venture_arrangement_id IS NULL

END


