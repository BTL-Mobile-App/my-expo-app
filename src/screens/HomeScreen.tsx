import React from "react";
import { View, Text, Button, StyleSheet } from "react-native";

const HomeScreen = ({ navigation }: any) => {
  const handlePress = () => {
    console.log("Button Pressed");
    // Giả sử có navigation
    if (navigation) {
      navigation.navigate("Details");
    }
  };

  return (
    <View style={styles.container}>
      <Text testID="welcome-text">Welcome to Home Screen</Text>
      <Button
        title="Go to Details"
        onPress={handlePress}
        testID="detail-button"
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: "center", alignItems: "center" },
});

export default HomeScreen;
