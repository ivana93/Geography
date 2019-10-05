<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sat Dec 01 20:54:47 CET 2018 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
	<xsl:param name ="Country"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Geography now</title>
			</head>
			<body>
				<h1>Geography</h1><!-- Creating the first table -->
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Country</th>
						<th>Capital</th>
						<th>Language</th>
						<th>Area</th>
						<th>Population </th>
						<th>Details</th>
						<th>Religion</th>
						<th>Currency</th>
					</tr>
					<xsl:for-each select="//geography/countries/country[name=$Country]">
						<tr>
							<td>
								<xsl:value-of select="name"/>
							</td>
							<td>
								<xsl:value-of select="capital"/>
							</td>
							<td>
								<xsl:value-of select="language"/>
							</td>

							<td  width="6%">
								<xsl:value-of select="area"/>
							</td>
							<td>
								<xsl:value-of select="population"/>
							</td>
							<td>
								<xsl:value-of select="details"/>
							</td>
							<td>
							
								<xsl:apply-templates select="religion"/>
							
							</td>
							<td>
								<xsl:value-of select="currency"/>
							</td>
							
							
						</tr>
					</xsl:for-each>
				</table>
				
				
				
			</body>
		</html>
	</xsl:template>
	
	
	
	<xsl:template match="religion">
		<xsl:apply-templates select="/geography/religions/religion[id=current()]"/>
		<xsl:if test="position() != last()">, </xsl:if>
	</xsl:template>
	<xsl:template match="/geography/religions/religion">
		<xsl:value-of select="description"/>
	</xsl:template>
	
</xsl:stylesheet>
