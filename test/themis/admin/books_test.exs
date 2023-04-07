defmodule Themis.Admin.BooksTest do
  use Themis.DataCase

  alias Themis.Admin.Books

  describe "collections" do
    alias Themis.Admin.Books.Collection

    import Themis.Admin.BooksFixtures

    @invalid_attrs %{name: nil, number: nil, publication_date: nil}

    test "list_collections/0 returns all collections" do
      collection = collection_fixture()
      assert Books.list_collections() == [collection]
    end

    test "get_collection!/1 returns the collection with given id" do
      collection = collection_fixture()
      assert Books.get_collection!(collection.id) == collection
    end

    test "create_collection/1 with valid data creates a collection" do
      valid_attrs = %{name: "some name", number: 42, publication_date: 42}

      assert {:ok, %Collection{} = collection} = Books.create_collection(valid_attrs)
      assert collection.name == "some name"
      assert collection.number == 42
      assert collection.publication_date == 42
    end

    test "create_collection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_collection(@invalid_attrs)
    end

    test "update_collection/2 with valid data updates the collection" do
      collection = collection_fixture()
      update_attrs = %{name: "some updated name", number: 43, publication_date: 43}

      assert {:ok, %Collection{} = collection} = Books.update_collection(collection, update_attrs)
      assert collection.name == "some updated name"
      assert collection.number == 43
      assert collection.publication_date == 43
    end

    test "update_collection/2 with invalid data returns error changeset" do
      collection = collection_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_collection(collection, @invalid_attrs)
      assert collection == Books.get_collection!(collection.id)
    end

    test "delete_collection/1 deletes the collection" do
      collection = collection_fixture()
      assert {:ok, %Collection{}} = Books.delete_collection(collection)
      assert_raise Ecto.NoResultsError, fn -> Books.get_collection!(collection.id) end
    end

    test "change_collection/1 returns a collection changeset" do
      collection = collection_fixture()
      assert %Ecto.Changeset{} = Books.change_collection(collection)
    end
  end
end
