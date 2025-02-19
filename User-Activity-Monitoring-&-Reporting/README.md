# User Activity Monitoring and Reporting

## Task Description
As a system administrator at “MyComp,” you are responsible for keeping track of user activity on the
system, including login and logout times. To effectively monitor this activity and generate useful insights,
you need to develop a script that records user activity and generates daily and weekly reports. These
reports should include details about user login/logout times and durations of sessions.

## Requirements
1. **Monitor User Activity**:
      - Track user login and logout times.
      - Record the duration of user sessions.
2. **Generate Daily Reports**:
      - Create a report summarizing user activity for the current day.
3. **Generate Weekly Reports**:
      - Create a report summarizing user activity for the current week.
4. **Log Management**:
      - Maintain logs of user activity.
      - Archive logs older than a certain period.
5. **User-Friendly Output**:
      - Provide clear and readable reports.
  
## How It Works
  - The script continuously monitors user login/logout activity.
  - It records timestamps and calculates session durations.
  - Daily and weekly reports are generated for easy review.
  - Older logs are archived periodically to avoid clutter.

## Usage
1. Grant execution permissions:
    - chmod +x user_activity_monitor.sh
2. Run the script:
    - ./user_activity_monitor.sh
  
## Log and Report Locations
  - **Activity logs**: /var/log/user_activity.log
  - **Daily reports**: /var/log/user_daily_report.txt
  - **Weekly reports**: /var/log/user_weekly_report.txt
  - **Archived logs**: /var/log/user_activity_archive/
