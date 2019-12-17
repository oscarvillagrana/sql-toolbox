# Not Quite A Base

# Data Science from Scratch. pg275

# user data set (user_id, name, num_friends)

# users = [[0, "User1", 0],
#          [1, "User2", 2],
#          [2, "User3", 3],
#          [3, "User4", 4]]


############################################################
#
# store each row as a dict from column names to values
#
############################################################


class Table:
    def _init_(self, columns):
        self.columns = columns
        self.row = []

    def _repr_(self):
        """pretty representation of the table: columns then rows"""
        return str(self.columns) + "\n" + "\n".join(map(str, self.rows))

    def insert(self, row_values):
        if len(row_values) != len(self.columns):
            raise TypeError("wrong numner of elements")
        row_dict = dict(zip(self.comlumns, row_values))
        self.rows.append(row_dict)


############################################################
#
### Table data insert once table is created
#
############################################################


users = Table(["user_id", "name", "num_friends"])
users.insert([0, "User1", 0])
users.insert([1, "User2", 1])
users.insert([2, "User3", 2])
users.insert([3, "User4", 3])
users.insert([4, "User5", 4])
users.insert([5, "User6", 5])
users.insert([6, "User7", 6])
users.insert([7, "User8", 7])
users.insert([8, "User9", 8])
users.insert([9, "User10", 9])
users.insert([10, "User11", 10])
users.insert([11, "User12", 11])


############################################################
#
### UPDATE function
#
############################################################


def update(self, updates, predicate):
    for row in self.rows:
        if predicate(row):
            for column, new_value in updates.iteritems():
                row[column] = new_value


#
#
# calling the update function
#
#


users.update({'num_friends' : 3},
             lambda row: row ['user_id'] == 1)


############################################################
#
### DELETE
#
############################################################


# easily added function to our Table

def delete(self, predicate=lambda row: True):
    """delete all rows matching prediate 
    or all rows if no predicate supplied"""
    self.rows = [row for row in self.rows if not(predicate(row))]

# a WHERE clause is a predicate function

users.delete(lambda row: row["user_id"] == 1) 	# deletes row with user_id == 1
users.delete()									# deletes every row


############################################################
#
### SELECT
#
############################################################


# a select() method that return a new Table

# two optional arguments: keep_columns & additional_columns

def select(self, keep_columns=None, additional_columns=None):

    if keep_columns is None:			# if no columns specified
        keep_columns = self.columns 	# reaturn all columns

    if additional_columns is None:
        additional_columns = {}

	# new table for results
    result_table = Table(keep_columns + additional_columns.keys())

    for row in self.rows:
        new_row = [row[column] for column in keep_columns]
        for column_name, calculation in additional_columns.iteritems():
            new_row.append(calculation())
        result_table.instert(new_row)

    return result_table

# creates WHERE & LIMIT methods

def where(self, predicate=lambda row: True):
    """return only the rows that satisfy he supplied predicate"""
    where_table = Table(self.columns)
    where_table.rows = self.filter(predicate, self.rows)

def limit(self, num_rows):
    """return only the rows that satisfy the supplied predicate"""
    limit_table = Table(self.columns)
    limit_table.rows = self.rows[:num_rows]
    return limit_table


############################################################
#
# SELECT * FROM users;
#
############################################################


users.select()

# SELECT * FROM users LIMIT 2;
users.limit(2)

# SELECT user_id FROM users;
users.select(keep_columns=["user_id"])

# SELECT user_id FROM users WHERE name = "User1"
users.where(lambda row: row["name"] == "User1") \
     .select(keep_columns=["user_id"])

# SELECT LENGTH(name) AS name_length FROM users;
def name_length(row): return len(row["name"])

users.select(keep_columns=[],
            additional_columns = { "name_length" : name_length })


############################################################
#
### GROUP BY
#
############################################################


def group_by(self, group_by_columns, aggregates, having=None):

        grouped_rows = defaultdict(list)

        # populate groups
        for row in self.rows:
            key = tuple(row[column] for column in group_by_columns)
            grouped_rows[key].append(row)

        # result table consists of group_by columns and aggregates
        result_table = Table(group_by_columns + aggregates.keys())

        for key, rows in grouped_rows.iteritems():
            if having is None or having(rows):
                new_row = list(key)
                for aggregate_name, aggregate_fn in aggregates.iteritems():
                    new_row.append(aggregate_fn(rows))
                result_table.insert(new_row)

        return result_table


############################################################
#
# min user id
#
############################################################


def min_user_id(rows): return min(row["user_id"] for row in rows)

stats_by_length = users \
    .select(additional_columns={"name_length" : name_length}) \
    .group_by(group_by_columns=["name_length"],
              aggregates={ "min_user_id" : min_user_id,
                           "num_users" : len })


############################################################
#
# first_letter metrics
#
############################################################


def first_letter_of_name(row):
    return row["name"][0] if row["name"] else ""

def average_num_friends(rows):
    return sum(row["num_friends"] for row in rows) / len(rows)

def enough_friends(rows):
    return average_num_friends(rows) > 1

avg_friends_by_letter = users \
    .select(additional_columns={'first_letter' : first_letter_of_name}) \
    .group_by(group_by_columns=['first_letter'],
              aggregates={ "avg_num_friends" : average_num_friends },
              having=enough_friends)


############################################################
#
# user id sum
#
############################################################


def sum_user_ids(rows): return sum(row["user_id"] for row in rows)

user_id_sum = users \
    .where(lambda row: row["user_id"] > 1) \
    .group_by(group_by_columns=[],
              aggregates={ "user_id_sum" : sum_user_ids })

############################################################
#
# order by
#
############################################################

def order_by(self, order):
        new_table = self.select()       # make a copy
        new_table.rows.sort(key=order)
        return new_table


############################################################
#
# use as follows
#
############################################################


friendliest_letters = avg_friends_by_letter \
    .order_by(lambda row: -row["avg_num_friends"]) \
    .limit(4)


############################################################
#
# data science from scratch. pg.533
# join
#
############################################################


def join(self, other_table, left_join=False):

        join_on_columns = [c for c in self.columns           # columns in
                           if c in other_table.columns]      # both tables

        additional_columns = [c for c in other_table.columns # columns only
                              if c not in join_on_columns]   # in right table

        # all columns from left table + additional_columns from right table
        join_table = Table(self.columns + additional_columns)

        for row in self.rows:
            def is_join(other_row):
                return all(other_row[c] == row[c] for c in join_on_columns)

            other_rows = other_table.where(is_join).rows

            # each other row that matches this one produces a result row
            for other_row in other_rows:
                join_table.insert([row[c] for c in self.columns] +
                                  [other_row[c] for c in additional_columns])

            # if no rows match and it's a left join, output with Nones
            if left_join and not other_rows:
                join_table.insert([row[c] for c in self.columns] + [None for c in additional_columns])

        return join_table


############################################################
#
# find users interest
#
############################################################


sql_users = users \
    .join(user_interests) \
    .where(lambda row: row["interest"] == "SQL") \
    .select(keep_columns=["name"])

#
# interest's counts
#

def count_interests(rows):
    """counts how many rows have non-None interests"""
    return len([row for row in rows if row["interest"] is not None])

user_interest_counts = users \
    .join(user_interests, left_join=True) \
    .group_by(group_by_columns=["user_id"],
              aggregates={"num_interests" : count_interests })


############################################################
#
# subquries
#
############################################################


likes_sql_user_ids = user_interests \
    .where(lambda row: row["interest"] == "SQL") \
    .select(keep_columns=['user_id'])

likes_sql_user_ids.group_by(group_by_columns=[],
                            aggregates={ "min_user_id" : min_user_id })
  

############################################################
#
# query optimization
# data science from scratch. pg.538
#
############################################################


user_interests \
    .where(lambda row: row["interest"] == "SQL") \
    .join(users) \
    .select(["name"])

# Or you could filter the results of the join:

user_interests \
    .join(users) \
    .where(lambda row: row["interest"] == "SQL") \
    .select(["name"])