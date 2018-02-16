# user_role_hierarchy_changes
Code to run in developer console to update manager and directors on the user record. If a COS has occurred and the ReportsTo has been changed this process won't work.

Vacation, LOA or permanent change  
1. Run update_manager.sql to get a count on users to update, new Manager Employee Number, and old manager employee number.
2. Update magic variables
3. Click on the [Execute] button
4. Review debug only
5. When satisfied change magic variable toUpdate to true.

Return from vacation or LOA
Please note if a COS was performed during vacation or LOA.

Things to consider.

Manager A is going on vacation.  
Manager A asks that EI's to be approved by Manager b.  
A COS isn't done to update the reports to.

Manager A
E1
E2
E3

Manager b
E4
E5

After update

Manager A

Manager b
E1
E2
E3
E4
E5

In this case to switch back the newManagerEmployeeNumber and
oldManagerEmployeeNumber would be the same.
