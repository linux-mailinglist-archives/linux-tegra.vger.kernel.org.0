Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA5B21C86C
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Jul 2020 12:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgGLKBn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Jul 2020 06:01:43 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4516 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgGLKBi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Jul 2020 06:01:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0adf480000>; Sun, 12 Jul 2020 03:00:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:01:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 12 Jul 2020 03:01:37 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:01:36 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:01:36 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0adf7f0000>; Sun, 12 Jul 2020 03:01:36 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/5] firmware: tegra: Update BPMP ABI
Date:   Sun, 12 Jul 2020 11:01:18 +0100
Message-ID: <20200712100118.13343-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200712100118.13343-1-jonathanh@nvidia.com>
References: <20200712100118.13343-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594548040; bh=O82rwjMjaDHv5y4t0VDrKx741GpqrOdDc/xXI0M45gM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=m4JRmEncst7wPtwozgBVQG2hanbe05GZFUCSrdE2mvIngU8sAAYmj+iUVOyj/06g4
         KJzL368/jXgb9wueL3CWjYxbl1QGSxbpleSBfFOqzDV25y2CP+S+WPONNZPBZfrros
         P8uZYq7gO4oYot3gG0h+//k3PCubz0dxw1qQRL+vaVrdLTc7eIrcEnD/Hb756pPV7G
         c+GSYFY5wuPaBuSHIsmEjztd/M0nTL9oYRyfXDk3bs93aLoTGISd/lcv6MS8M0N5//
         7GWwyyHRxSa6rrJwtqQR/dyZ1zcbYARD5j/xHdVbzs3kzbBDmQlWqLA2ByopesQCTA
         QG/6oINlIQDNQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Update the BPMP ABI to align with the the latest version.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 include/soc/tegra/bpmp-abi.h | 748 +++++++++++++++++++++--------------
 1 file changed, 460 insertions(+), 288 deletions(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 4896227eef1a..bff99f23860c 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -3,28 +3,38 @@
  * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
-#ifndef _ABI_BPMP_ABI_H_
-#define _ABI_BPMP_ABI_H_
+#ifndef ABI_BPMP_ABI_H
+#define ABI_BPMP_ABI_H
 
-#ifdef LK
+#if defined(LK) || defined(BPMP_ABI_HAVE_STDC)
+#include <stddef.h>
 #include <stdint.h>
 #endif
 
-#ifndef __ABI_PACKED
-#define __ABI_PACKED __attribute__((packed))
+#ifndef BPMP_ABI_PACKED
+#ifdef __ABI_PACKED
+#define BPMP_ABI_PACKED __ABI_PACKED
+#else
+#define BPMP_ABI_PACKED __attribute__((packed))
+#endif
 #endif
 
 #ifdef NO_GCC_EXTENSIONS
-#define EMPTY char empty;
-#define EMPTY_ARRAY 1
+#define BPMP_ABI_EMPTY char empty;
+#define BPMP_ABI_EMPTY_ARRAY 1
 #else
-#define EMPTY
-#define EMPTY_ARRAY 0
+#define BPMP_ABI_EMPTY
+#define BPMP_ABI_EMPTY_ARRAY 0
 #endif
 
-#ifndef __UNION_ANON
-#define __UNION_ANON
+#ifndef BPMP_UNION_ANON
+#ifdef __UNION_ANON
+#define BPMP_UNION_ANON __UNION_ANON
+#else
+#define BPMP_UNION_ANON
+#endif
 #endif
+
 /**
  * @file
  */
@@ -73,6 +83,7 @@
 struct mrq_request {
 	/** @brief MRQ number of the request */
 	uint32_t mrq;
+
 	/**
 	 * @brief Flags providing follow up directions to the receiver
 	 *
@@ -82,7 +93,7 @@ struct mrq_request {
 	 * | 0   | should be 1                                |
 	 */
 	uint32_t flags;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Format
@@ -98,18 +109,18 @@ struct mrq_response {
 	int32_t err;
 	/** @brief Reserved for future use */
 	uint32_t flags;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Format
  * Minimum needed size for an IPC message buffer
  */
-#define MSG_MIN_SZ	128
+#define MSG_MIN_SZ	128U
 /**
  * @ingroup MRQ_Format
  *  Minimum size guaranteed for data in an IPC message buffer
  */
-#define MSG_DATA_MIN_SZ	120
+#define MSG_DATA_MIN_SZ	120U
 
 /**
  * @ingroup MRQ_Codes
@@ -118,37 +129,36 @@ struct mrq_response {
  * @{
  */
 
-#define MRQ_PING		0
-#define MRQ_QUERY_TAG		1
-#define MRQ_MODULE_LOAD		4
-#define MRQ_MODULE_UNLOAD	5
-#define MRQ_TRACE_MODIFY	7
-#define MRQ_WRITE_TRACE		8
-#define MRQ_THREADED_PING	9
-#define MRQ_MODULE_MAIL		11
-#define MRQ_DEBUGFS		19
-#define MRQ_RESET		20
-#define MRQ_I2C			21
-#define MRQ_CLK			22
-#define MRQ_QUERY_ABI		23
-#define MRQ_PG_READ_STATE	25
-#define MRQ_PG_UPDATE_STATE	26
-#define MRQ_THERMAL		27
-#define MRQ_CPU_VHINT		28
-#define MRQ_ABI_RATCHET		29
-#define MRQ_EMC_DVFS_LATENCY	31
-#define MRQ_TRACE_ITER		64
-#define MRQ_RINGBUF_CONSOLE	65
-#define MRQ_PG			66
-#define MRQ_CPU_NDIV_LIMITS	67
-#define MRQ_STRAP               68
-#define MRQ_UPHY		69
-#define MRQ_CPU_AUTO_CC3	70
-#define MRQ_QUERY_FW_TAG	71
-#define MRQ_FMON		72
-#define MRQ_EC			73
-#define MRQ_FBVOLT_STATUS	74
-#define MRQ_DEBUG		75
+#define MRQ_PING		0U
+#define MRQ_QUERY_TAG		1U
+#define MRQ_MODULE_LOAD		4U
+#define MRQ_MODULE_UNLOAD	5U
+#define MRQ_TRACE_MODIFY	7U
+#define MRQ_WRITE_TRACE		8U
+#define MRQ_THREADED_PING	9U
+#define MRQ_MODULE_MAIL		11U
+#define MRQ_DEBUGFS		19U
+#define MRQ_RESET		20U
+#define MRQ_I2C			21U
+#define MRQ_CLK			22U
+#define MRQ_QUERY_ABI		23U
+#define MRQ_PG_READ_STATE	25U
+#define MRQ_PG_UPDATE_STATE	26U
+#define MRQ_THERMAL		27U
+#define MRQ_CPU_VHINT		28U
+#define MRQ_ABI_RATCHET		29U
+#define MRQ_EMC_DVFS_LATENCY	31U
+#define MRQ_TRACE_ITER		64U
+#define MRQ_RINGBUF_CONSOLE	65U
+#define MRQ_PG			66U
+#define MRQ_CPU_NDIV_LIMITS	67U
+#define MRQ_STRAP               68U
+#define MRQ_UPHY		69U
+#define MRQ_CPU_AUTO_CC3	70U
+#define MRQ_QUERY_FW_TAG	71U
+#define MRQ_FMON		72U
+#define MRQ_EC			73U
+#define MRQ_DEBUG		75U
 
 /** @} */
 
@@ -157,7 +167,7 @@ struct mrq_response {
  * @brief Maximum MRQ code to be sent by CPU software to
  * BPMP. Subject to change in future
  */
-#define MAX_CPU_MRQ_ID		75
+#define MAX_CPU_MRQ_ID		75U
 
 /**
  * @addtogroup MRQ_Payloads
@@ -224,7 +234,7 @@ struct mrq_response {
 struct mrq_ping_request {
 /** @brief Arbitrarily chosen value */
 	uint32_t challenge;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Ping
@@ -238,7 +248,7 @@ struct mrq_ping_request {
 struct mrq_ping_response {
 	/** @brief Response to the MRQ_PING challege */
 	uint32_t reply;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Codes
@@ -265,7 +275,7 @@ struct mrq_ping_response {
 struct mrq_query_tag_request {
   /** @brief Base address to store the firmware tag */
 	uint32_t addr;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 
 /**
@@ -292,15 +302,15 @@ struct mrq_query_tag_request {
 struct mrq_query_fw_tag_response {
   /** @brief Array to store tag information */
 	uint8_t tag[32];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_MODULE_LOAD
  * @brief Dynamically load a BPMP code module
  *
- * * Platforms: T210, T214, T186
- * @cond (bpmp_t210 || bpmp_t214 || bpmp_t186)
+ * * Platforms: T210, T210B01, T186
+ * @cond (bpmp_t210 || bpmp_t210b01 || bpmp_t186)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_module_load_request
@@ -328,11 +338,11 @@ struct mrq_query_fw_tag_response {
  *
  */
 struct mrq_module_load_request {
-	/** @brief Base address of the code to load. Treated as (void *) */
-	uint32_t phys_addr; /* (void *) */
+	/** @brief Base address of the code to load */
+	uint32_t phys_addr;
 	/** @brief Size in bytes of code to load */
 	uint32_t size;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Module
@@ -343,7 +353,7 @@ struct mrq_module_load_request {
 struct mrq_module_load_response {
 	/** @brief Handle to the loaded module */
 	uint32_t base;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @endcond*/
 
 /**
@@ -351,8 +361,8 @@ struct mrq_module_load_response {
  * @def MRQ_MODULE_UNLOAD
  * @brief Unload a previously loaded code module
  *
- * * Platforms: T210, T214, T186
- * @cond (bpmp_t210 || bpmp_t214 || bpmp_t186)
+ * * Platforms: T210, T210B01, T186
+ * @cond (bpmp_t210 || bpmp_t210b01 || bpmp_t186)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_module_unload_request
@@ -371,7 +381,7 @@ struct mrq_module_load_response {
 struct mrq_module_unload_request {
 	/** @brief Handle of the module to unload */
 	uint32_t base;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @endcond*/
 
 /**
@@ -379,6 +389,8 @@ struct mrq_module_unload_request {
  * @def MRQ_TRACE_MODIFY
  * @brief Modify the set of enabled trace events
  *
+ * @deprecated
+ *
  * * Platforms: All
  * * Initiators: CCPLEX
  * * Targets: BPMP
@@ -401,7 +413,7 @@ struct mrq_trace_modify_request {
 	uint32_t clr;
 	/** @brief Bit mask of trace events to enable */
 	uint32_t set;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Trace
@@ -415,13 +427,15 @@ struct mrq_trace_modify_request {
 struct mrq_trace_modify_response {
 	/** @brief Bit mask of trace event enable states */
 	uint32_t mask;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_WRITE_TRACE
  * @brief Write trace data to a buffer
  *
+ * @deprecated
+ *
  * * Platforms: All
  * * Initiators: CCPLEX
  * * Targets: BPMP
@@ -455,7 +469,7 @@ struct mrq_write_trace_request {
 	uint32_t area;
 	/** @brief Size in bytes of the output buffer */
 	uint32_t size;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Trace
@@ -472,25 +486,25 @@ struct mrq_write_trace_response {
 	 * drained to the outputbuffer. Value is 0 otherwise.
 	 */
 	uint32_t eof;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct mrq_threaded_ping_request {
 	uint32_t challenge;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct mrq_threaded_ping_response {
 	uint32_t reply;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_MODULE_MAIL
  * @brief Send a message to a loadable module
  *
- * * Platforms: T210, T214, T186
- * @cond (bpmp_t210 || bpmp_t214 || bpmp_t186)
+ * * Platforms: T210, T210B01, T186
+ * @cond (bpmp_t210 || bpmp_t210b01 || bpmp_t186)
  * * Initiators: Any
  * * Targets: BPMP
  * * Request Payload: @ref mrq_module_mail_request
@@ -511,8 +525,8 @@ struct mrq_module_mail_request {
 	 * The length of data[ ] is unknown to the BPMP core firmware
 	 * but it is limited to the size of an IPC message.
 	 */
-	uint8_t data[EMPTY_ARRAY];
-} __ABI_PACKED;
+	uint8_t data[BPMP_ABI_EMPTY_ARRAY];
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Module
@@ -524,8 +538,8 @@ struct mrq_module_mail_response {
 	 * The length of data[ ] is unknown to the BPMP core firmware
 	 * but it is limited to the size of an IPC message.
 	 */
-	uint8_t data[EMPTY_ARRAY];
-} __ABI_PACKED;
+	uint8_t data[BPMP_ABI_EMPTY_ARRAY];
+} BPMP_ABI_PACKED;
 /** @endcond */
 
 /**
@@ -590,7 +604,7 @@ struct cmd_debugfs_fileop_request {
 	uint32_t dataaddr;
 	/** @brief Length in bytes of data buffer */
 	uint32_t datalen;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -601,7 +615,7 @@ struct cmd_debugfs_dumpdir_request {
 	uint32_t dataaddr;
 	/** @brief Length in bytes of data buffer */
 	uint32_t datalen;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -612,7 +626,7 @@ struct cmd_debugfs_fileop_response {
 	uint32_t reserved;
 	/** @brief Number of bytes read from or written to data buffer */
 	uint32_t nbytes;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -623,7 +637,7 @@ struct cmd_debugfs_dumpdir_response {
 	uint32_t reserved;
 	/** @brief Number of bytes read from or written to data buffer */
 	uint32_t nbytes;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -646,8 +660,8 @@ struct mrq_debugfs_request {
 	union {
 		struct cmd_debugfs_fileop_request fop;
 		struct cmd_debugfs_dumpdir_request dumpdir;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -662,8 +676,8 @@ struct mrq_debugfs_response {
 		struct cmd_debugfs_fileop_response fop;
 		/** @brief Response data for CMD_DEBUGFS_DUMPDIR command */
 		struct cmd_debugfs_dumpdir_response dumpdir;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @addtogroup Debugfs
@@ -735,7 +749,7 @@ struct cmd_debug_fopen_request {
 	 * length @ref DEBUG_FNAME_MAX_SZ
 	 */
 	char name[DEBUG_FNAME_MAX_SZ];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -748,7 +762,7 @@ struct cmd_debug_fopen_response {
 	 * Maximum allowed length for WRITE command
 	 */
 	uint32_t datalen;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -759,7 +773,7 @@ struct cmd_debug_fread_request {
 	 * to CMD_DEBUG_OPEN_RO request
 	 */
 	uint32_t fd;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -778,7 +792,7 @@ struct cmd_debug_fread_response {
 	uint32_t readlen;
 	/** @brief File data from seek position */
 	char data[DEBUG_READ_MAX_SZ];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -801,7 +815,7 @@ struct cmd_debug_fwrite_request {
 	uint32_t datalen;
 	/** @brief Data to be written */
 	char data[DEBUG_WRITE_MAX_SZ];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -812,7 +826,7 @@ struct cmd_debug_fclose_request {
 	 * to CMD_DEBUG_OPEN_RO request
 	 */
 	uint32_t fd;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -843,8 +857,8 @@ struct mrq_debug_request {
 		struct cmd_debug_fwrite_request fwr;
 		/** @brief Request payload for CMD_DEBUG_CLOSE command */
 		struct cmd_debug_fclose_request fcl;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Debugfs
@@ -855,8 +869,8 @@ struct mrq_debug_response {
 		struct cmd_debug_fopen_response fop;
 		/** @brief Response data for CMD_DEBUG_READ command */
 		struct cmd_debug_fread_response frd;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Codes
@@ -874,14 +888,41 @@ struct mrq_debug_response {
  */
 
 enum mrq_reset_commands {
-	/** @brief Assert module reset */
+	/**
+	 * @brief Assert module reset
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EINVAL if mrq_reset_request::reset_id is invalid @n
+	 * -#BPMP_EACCES if mrq master is not an owner of target domain reset @n
+	 * -#BPMP_ENOTSUP if target domain h/w state does not allow reset
+	 */
 	CMD_RESET_ASSERT = 1,
-	/** @brief Deassert module reset */
+	/**
+	 * @brief Deassert module reset
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EINVAL if mrq_reset_request::reset_id is invalid @n
+	 * -#BPMP_EACCES if mrq master is not an owner of target domain reset @n
+	 * -#BPMP_ENOTSUP if target domain h/w state does not allow reset
+	 */
 	CMD_RESET_DEASSERT = 2,
-	/** @brief Assert and deassert the module reset */
+	/**
+	 * @brief Assert and deassert the module reset
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_EINVAL if mrq_reset_request::reset_id is invalid @n
+	 * -#BPMP_EACCES if mrq master is not an owner of target domain reset @n
+	 * -#BPMP_ENOTSUP if target domain h/w state does not allow reset
+	 */
 	CMD_RESET_MODULE = 3,
-	/** @brief Get the highest reset ID */
+	/**
+	 * @brief Get the highest reset ID
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_ENODEV if no reset domains are supported (number of IDs is 0)
+	 */
 	CMD_RESET_GET_MAX_ID = 4,
+
 	/** @brief Not part of ABI and subject to change */
 	CMD_RESET_MAX,
 };
@@ -897,7 +938,7 @@ struct mrq_reset_request {
 	uint32_t cmd;
 	/** @brief Id of the reset to affected */
 	uint32_t reset_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Response for MRQ_RESET sub-command CMD_RESET_GET_MAX_ID. When
@@ -907,7 +948,7 @@ struct mrq_reset_request {
 struct cmd_reset_get_max_id_response {
 	/** @brief Max reset id */
 	uint32_t max_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Response with MRQ_RESET
@@ -926,8 +967,8 @@ struct cmd_reset_get_max_id_response {
 struct mrq_reset_response {
 	union {
 		struct cmd_reset_get_max_id_response reset_get_max_id;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /** @} */
 
@@ -945,17 +986,17 @@ struct mrq_reset_response {
  * @addtogroup I2C
  * @{
  */
-#define TEGRA_I2C_IPC_MAX_IN_BUF_SIZE	(MSG_DATA_MIN_SZ - 12)
-#define TEGRA_I2C_IPC_MAX_OUT_BUF_SIZE	(MSG_DATA_MIN_SZ - 4)
+#define TEGRA_I2C_IPC_MAX_IN_BUF_SIZE	(MSG_DATA_MIN_SZ - 12U)
+#define TEGRA_I2C_IPC_MAX_OUT_BUF_SIZE	(MSG_DATA_MIN_SZ - 4U)
 
-#define SERIALI2C_TEN           0x0010
-#define SERIALI2C_RD            0x0001
-#define SERIALI2C_STOP          0x8000
-#define SERIALI2C_NOSTART       0x4000
-#define SERIALI2C_REV_DIR_ADDR  0x2000
-#define SERIALI2C_IGNORE_NAK    0x1000
-#define SERIALI2C_NO_RD_ACK     0x0800
-#define SERIALI2C_RECV_LEN      0x0400
+#define SERIALI2C_TEN           0x0010U
+#define SERIALI2C_RD            0x0001U
+#define SERIALI2C_STOP          0x8000U
+#define SERIALI2C_NOSTART       0x4000U
+#define SERIALI2C_REV_DIR_ADDR  0x2000U
+#define SERIALI2C_IGNORE_NAK    0x1000U
+#define SERIALI2C_NO_RD_ACK     0x0800U
+#define SERIALI2C_RECV_LEN      0x0400U
 
 enum {
 	CMD_I2C_XFER = 1
@@ -985,7 +1026,7 @@ struct serial_i2c_request {
 	uint16_t len;
 	/** @brief For write transactions only, #len bytes of data */
 	uint8_t data[];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Trigger one or more i2c transactions
@@ -999,7 +1040,7 @@ struct cmd_i2c_xfer_request {
 
 	/** @brief Serialized packed instances of @ref serial_i2c_request*/
 	uint8_t data_buf[TEGRA_I2C_IPC_MAX_IN_BUF_SIZE];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Container for data read from the i2c bus
@@ -1013,7 +1054,7 @@ struct cmd_i2c_xfer_response {
 	uint32_t data_size;
 	/** @brief I2c read data */
 	uint8_t data_buf[TEGRA_I2C_IPC_MAX_OUT_BUF_SIZE];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Request with #MRQ_I2C
@@ -1023,14 +1064,25 @@ struct mrq_i2c_request {
 	uint32_t cmd;
 	/** @brief Parameters of the transfer request */
 	struct cmd_i2c_xfer_request xfer;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Response to #MRQ_I2C
+ *
+ * mrq_response:err is
+ *  0: Success
+ *  -#BPMP_EBADCMD: if mrq_i2c_request::cmd is other than 1
+ *  -#BPMP_EINVAL: if cmd_i2c_xfer_request does not contain correctly formatted request
+ *  -#BPMP_ENODEV: if cmd_i2c_xfer_request::bus_id is not supported by BPMP
+ *  -#BPMP_EACCES: if i2c transaction is not allowed due to firewall rules
+ *  -#BPMP_ETIMEDOUT: if i2c transaction times out
+ *  -#BPMP_ENXIO: if i2c slave device does not reply with ACK to the transaction
+ *  -#BPMP_EAGAIN: if ARB_LOST condition is detected by the i2c controller
+ *  -#BPMP_EIO: any other i2c controller error code than NO_ACK or ARB_LOST
  */
 struct mrq_i2c_response {
 	struct cmd_i2c_xfer_response xfer;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @} */
 
@@ -1063,90 +1115,105 @@ enum {
 	CMD_CLK_MAX,
 };
 
-#define BPMP_CLK_HAS_MUX	(1 << 0)
-#define BPMP_CLK_HAS_SET_RATE	(1 << 1)
-#define BPMP_CLK_IS_ROOT	(1 << 2)
+#define BPMP_CLK_HAS_MUX	(1U << 0U)
+#define BPMP_CLK_HAS_SET_RATE	(1U << 1U)
+#define BPMP_CLK_IS_ROOT	(1U << 2U)
+#define BPMP_CLK_IS_VAR_ROOT	(1U << 3U)
 
-#define MRQ_CLK_NAME_MAXLEN	40
-#define MRQ_CLK_MAX_PARENTS	16
+#define MRQ_CLK_NAME_MAXLEN	40U
+#define MRQ_CLK_MAX_PARENTS	16U
 
 /** @private */
 struct cmd_clk_get_rate_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_get_rate_response {
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_set_rate_request {
 	int32_t unused;
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_set_rate_response {
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_round_rate_request {
 	int32_t unused;
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_round_rate_response {
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_get_parent_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_get_parent_response {
 	uint32_t parent_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_set_parent_request {
 	uint32_t parent_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_set_parent_response {
 	uint32_t parent_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_is_enabled_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
+/**
+ * @brief Response data to #MRQ_CLK sub-command CMD_CLK_IS_ENABLED
+ */
 struct cmd_clk_is_enabled_response {
+	/**
+	 * @brief The state of the clock that has been succesfully
+	 * requested with CMD_CLK_ENABLE or CMD_CLK_DISABLE by the
+	 * master invoking the command earlier.
+	 *
+	 * The state may not reflect the physical state of the clock
+	 * if there are some other masters requesting it to be
+	 * enabled.
+	 *
+	 * Value 0 is disabled, all other values indicate enabled.
+	 */
 	int32_t state;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_enable_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_enable_response {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_disable_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_disable_response {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_get_all_info_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_get_all_info_response {
 	uint32_t flags;
@@ -1154,25 +1221,25 @@ struct cmd_clk_get_all_info_response {
 	uint32_t parents[MRQ_CLK_MAX_PARENTS];
 	uint8_t num_parents;
 	uint8_t name[MRQ_CLK_NAME_MAXLEN];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_get_max_clk_id_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_get_max_clk_id_response {
 	uint32_t max_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_clk_get_fmax_at_vmin_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 struct cmd_clk_get_fmax_at_vmin_response {
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Clocks
@@ -1227,8 +1294,8 @@ struct mrq_clk_request {
 		struct cmd_clk_get_max_clk_id_request clk_get_max_clk_id;
 		/** @private */
 		struct cmd_clk_get_fmax_at_vmin_request clk_get_fmax_at_vmin;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Clocks
@@ -1269,8 +1336,8 @@ struct mrq_clk_response {
 		struct cmd_clk_get_all_info_response clk_get_all_info;
 		struct cmd_clk_get_max_clk_id_response clk_get_max_clk_id;
 		struct cmd_clk_get_fmax_at_vmin_response clk_get_fmax_at_vmin;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /** @} */
 
@@ -1296,7 +1363,7 @@ struct mrq_clk_response {
 struct mrq_query_abi_request {
 	/** @brief MRQ code to query */
 	uint32_t mrq;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup ABI_info
@@ -1308,7 +1375,7 @@ struct mrq_query_abi_request {
 struct mrq_query_abi_response {
 	/** @brief 0 if queried MRQ is supported. Else, -#BPMP_ENODEV */
 	int32_t status;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup MRQ_Codes
@@ -1333,7 +1400,7 @@ struct mrq_query_abi_response {
 struct mrq_pg_read_state_request {
 	/** @brief ID of partition */
 	uint32_t partition_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup Powergating
@@ -1348,7 +1415,7 @@ struct mrq_pg_read_state_response {
 	 * * 1 : on
 	 */
 	uint32_t logic_state;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @endcond*/
 /** @} */
 
@@ -1398,7 +1465,7 @@ struct mrq_pg_update_state_request {
 	 *          @ref logic_state == 0x3)
 	 */
 	uint32_t clock_state;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @endcond*/
 
 /**
@@ -1494,25 +1561,38 @@ enum pg_states {
 struct cmd_pg_query_abi_request {
 	/** @ref mrq_pg_cmd */
 	uint32_t type;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_pg_set_state_request {
 	/** @ref pg_states */
 	uint32_t state;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
+/**
+ * @brief Response data to #MRQ_PG sub command #CMD_PG_GET_STATE
+ */
 struct cmd_pg_get_state_response {
-	/** @ref pg_states */
+	/**
+	 * @brief The state of the power partition that has been
+	 * succesfuly requested by the master earlier using #MRQ_PG
+	 * command #CMD_PG_SET_STATE.
+	 *
+	 * The state may not reflect the physical state of the power
+	 * partition if there are some other masters requesting it to
+	 * be enabled.
+	 *
+	 * See @ref pg_states for possible values
+	 */
 	uint32_t state;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_pg_get_name_response {
 	uint8_t name[MRQ_PG_NAME_MAXLEN];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_pg_get_max_id_response {
 	uint32_t max_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Request with #MRQ_PG
@@ -1537,8 +1617,8 @@ struct mrq_pg_request {
 	union {
 		struct cmd_pg_query_abi_request query_abi;
 		struct cmd_pg_set_state_request set_state;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Response to MRQ_PG
@@ -1560,8 +1640,8 @@ struct mrq_pg_response {
 		struct cmd_pg_get_state_response get_state;
 		struct cmd_pg_get_name_response get_name;
 		struct cmd_pg_get_max_id_response get_max_id;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /** @} */
 
@@ -1650,6 +1730,20 @@ enum mrq_thermal_host_to_bpmp_cmd {
 	 */
 	CMD_THERMAL_GET_NUM_ZONES = 3,
 
+	/**
+	 * @brief Get the thermtrip of the specified zone.
+	 *
+	 * Host needs to supply request parameters.
+	 *
+	 * mrq_response::err is
+	 * *  0: Valid zone information returned.
+	 * *  -#BPMP_EINVAL: Invalid request parameters.
+	 * *  -#BPMP_ENOENT: No driver registered for thermal zone.
+	 * *  -#BPMP_ERANGE if thermtrip is invalid or disabled.
+	 * *  -#BPMP_EFAULT: Problem reading zone information.
+	 */
+	CMD_THERMAL_GET_THERMTRIP = 4,
+
 	/** @brief: number of supported host-to-bpmp commands. May
 	 * increase in future
 	 */
@@ -1680,7 +1774,7 @@ enum mrq_thermal_bpmp_to_host_cmd {
  */
 struct cmd_thermal_query_abi_request {
 	uint32_t type;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /*
  * Host->BPMP request data for request type CMD_THERMAL_GET_TEMP
@@ -1689,7 +1783,7 @@ struct cmd_thermal_query_abi_request {
  */
 struct cmd_thermal_get_temp_request {
 	uint32_t zone;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /*
  * BPMP->Host reply data for request CMD_THERMAL_GET_TEMP
@@ -1702,7 +1796,7 @@ struct cmd_thermal_get_temp_request {
  */
 struct cmd_thermal_get_temp_response {
 	int32_t temp;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /*
  * Host->BPMP request data for request type CMD_THERMAL_SET_TRIP
@@ -1717,7 +1811,7 @@ struct cmd_thermal_set_trip_request {
 	int32_t low;
 	int32_t high;
 	uint32_t enabled;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /*
  * BPMP->Host request data for request type CMD_THERMAL_HOST_TRIP_REACHED
@@ -1726,7 +1820,7 @@ struct cmd_thermal_set_trip_request {
  */
 struct cmd_thermal_host_trip_reached_request {
 	uint32_t zone;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /*
  * BPMP->Host reply data for request type CMD_THERMAL_GET_NUM_ZONES
@@ -1736,7 +1830,25 @@ struct cmd_thermal_host_trip_reached_request {
  */
 struct cmd_thermal_get_num_zones_response {
 	uint32_t num;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
+
+/*
+ * Host->BPMP request data for request type CMD_THERMAL_GET_THERMTRIP
+ *
+ * zone: Number of thermal zone.
+ */
+struct cmd_thermal_get_thermtrip_request {
+	uint32_t zone;
+} BPMP_ABI_PACKED;
+
+/*
+ * BPMP->Host reply data for request CMD_THERMAL_GET_THERMTRIP
+ *
+ * thermtrip: HW shutdown temperature in millicelsius.
+ */
+struct cmd_thermal_get_thermtrip_response {
+	int32_t thermtrip;
+} BPMP_ABI_PACKED;
 
 /*
  * Host->BPMP request data.
@@ -1752,8 +1864,9 @@ struct mrq_thermal_host_to_bpmp_request {
 		struct cmd_thermal_query_abi_request query_abi;
 		struct cmd_thermal_get_temp_request get_temp;
 		struct cmd_thermal_set_trip_request set_trip;
-	} __UNION_ANON;
-} __ABI_PACKED;
+		struct cmd_thermal_get_thermtrip_request get_thermtrip;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /*
  * BPMP->Host request data.
@@ -1765,16 +1878,17 @@ struct mrq_thermal_bpmp_to_host_request {
 	uint32_t type;
 	union {
 		struct cmd_thermal_host_trip_reached_request host_trip_reached;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /*
  * Data in reply to a Host->BPMP request.
  */
 union mrq_thermal_bpmp_to_host_response {
 	struct cmd_thermal_get_temp_response get_temp;
+	struct cmd_thermal_get_thermtrip_response get_thermtrip;
 	struct cmd_thermal_get_num_zones_response get_num_zones;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @} */
 
 /**
@@ -1806,7 +1920,7 @@ struct mrq_cpu_vhint_request {
 	uint32_t addr;
 	/** @brief ID of the cluster whose data is requested */
 	uint32_t cluster_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Description of the CPU v/f relation
@@ -1833,7 +1947,7 @@ struct cpu_vhint_data {
 	uint16_t vindex_div;
 	/** reserved for future use */
 	uint16_t reserved[328];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @endcond */
 /** @} */
 
@@ -1922,11 +2036,11 @@ struct mrq_abi_ratchet_response {
  * @brief Used by @ref mrq_emc_dvfs_latency_response
  */
 struct emc_dvfs_latency {
-	/** @brief EMC frequency in kHz */
+	/** @brief EMC DVFS node frequency in kHz */
 	uint32_t freq;
 	/** @brief EMC DVFS latency in nanoseconds */
 	uint32_t latency;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 #define EMC_DVFS_LATENCY_MAX_SIZE	14
 /**
@@ -1935,9 +2049,9 @@ struct emc_dvfs_latency {
 struct mrq_emc_dvfs_latency_response {
 	/** @brief The number valid entries in #pairs */
 	uint32_t num_pairs;
-	/** @brief EMC <frequency, latency> information */
+	/** @brief EMC DVFS node <frequency, latency> information */
 	struct emc_dvfs_latency pairs[EMC_DVFS_LATENCY_MAX_SIZE];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @} */
 
@@ -1962,7 +2076,7 @@ struct mrq_emc_dvfs_latency_response {
 struct mrq_cpu_ndiv_limits_request {
 	/** @brief Enum cluster_id */
 	uint32_t cluster_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Response to #MRQ_CPU_NDIV_LIMITS
@@ -1978,7 +2092,7 @@ struct mrq_cpu_ndiv_limits_response {
 	uint16_t ndiv_max;
 	/** @brief Minimum allowed NDIV value */
 	uint16_t ndiv_min;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @} */
 /** @endcond */
@@ -2010,7 +2124,7 @@ struct mrq_cpu_ndiv_limits_response {
 struct mrq_cpu_auto_cc3_request {
 	/** @brief Enum cluster_id (logical cluster id, known to CCPLEX s/w) */
 	uint32_t cluster_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @brief Response to #MRQ_CPU_AUTO_CC3
@@ -2024,7 +2138,7 @@ struct mrq_cpu_auto_cc3_response {
 	 * - bit [0] if "1" auto-CC3 is allowed, if "0" auto-CC3 is not allowed
 	 */
 	uint32_t auto_cc3_config;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @} */
 /** @endcond */
@@ -2034,6 +2148,8 @@ struct mrq_cpu_auto_cc3_response {
  * @def MRQ_TRACE_ITER
  * @brief Manage the trace iterator
  *
+ * @deprecated
+ *
  * * Platforms: All
  * * Initiators: CCPLEX
  * * Targets: BPMP
@@ -2055,7 +2171,7 @@ enum {
 struct mrq_trace_iter_request {
 	/** @brief TRACE_ITER_INIT or TRACE_ITER_CLEAN */
 	uint32_t cmd;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @} */
 
@@ -2131,12 +2247,12 @@ enum mrq_ringbuf_console_host_to_bpmp_cmd {
 struct cmd_ringbuf_console_query_abi_req {
 	/** @brief Command identifier to be queried */
 	uint32_t cmd;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_ringbuf_console_query_abi_resp {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2147,7 +2263,7 @@ struct cmd_ringbuf_console_read_req {
 	 * @brief Number of bytes requested to be read from the BPMP TX buffer
 	 */
 	uint8_t len;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2158,7 +2274,7 @@ struct cmd_ringbuf_console_read_resp {
 	uint8_t data[MRQ_RINGBUF_CONSOLE_MAX_READ_LEN];
 	/** @brief Number of bytes in cmd_ringbuf_console_read_resp::data */
 	uint8_t len;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2169,7 +2285,7 @@ struct cmd_ringbuf_console_write_req {
 	uint8_t data[MRQ_RINGBUF_CONSOLE_MAX_WRITE_LEN];
 	/** @brief Number of bytes in cmd_ringbuf_console_write_req::data */
 	uint8_t len;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2180,12 +2296,12 @@ struct cmd_ringbuf_console_write_resp {
 	uint32_t space_avail;
 	/** @brief Number of bytes that were written to the BPMP RX buffer */
 	uint8_t len;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_ringbuf_console_get_fifo_req {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2200,7 +2316,7 @@ struct cmd_ringbuf_console_get_fifo_resp {
 	uint64_t bpmp_tx_tail_addr;
 	/** @brief Length of the BPMP TX buffer */
 	uint32_t bpmp_tx_buf_len;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2220,8 +2336,8 @@ struct mrq_ringbuf_console_host_to_bpmp_request {
 		struct cmd_ringbuf_console_read_req read;
 		struct cmd_ringbuf_console_write_req write;
 		struct cmd_ringbuf_console_get_fifo_req get_fifo;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup RingbufConsole
@@ -2234,7 +2350,7 @@ union mrq_ringbuf_console_bpmp_to_host_response {
 	struct cmd_ringbuf_console_read_resp read;
 	struct cmd_ringbuf_console_write_resp write;
 	struct cmd_ringbuf_console_get_fifo_resp get_fifo;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 /** @} */
 
 /**
@@ -2278,7 +2394,7 @@ struct mrq_strap_request {
 	uint32_t id;
 	/** @brief Desired value for strap (if cmd is #STRAP_SET) */
 	uint32_t value;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @defgroup Strap_Ids Strap Identifiers
@@ -2321,28 +2437,28 @@ struct cmd_uphy_margin_control_request {
 	uint32_t y;
 	/** @brief Set number of bit blocks for each margin section */
 	uint32_t nblks;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_uphy_margin_status_response {
 	/** @brief Number of errors observed */
 	uint32_t status;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_init_request {
 	/** @brief EP controller number, valid: 0, 4, 5 */
 	uint8_t ep_controller;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_uphy_pcie_controller_state_request {
 	/** @brief PCIE controller number, valid: 0, 1, 2, 3, 4 */
 	uint8_t pcie_controller;
 	uint8_t enable;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_off_request {
 	/** @brief EP controller number, valid: 0, 4, 5 */
 	uint8_t ep_controller;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup UPHY
@@ -2373,8 +2489,8 @@ struct mrq_uphy_request {
 		struct cmd_uphy_ep_controller_pll_init_request ep_ctrlr_pll_init;
 		struct cmd_uphy_pcie_controller_state_request controller_state;
 		struct cmd_uphy_ep_controller_pll_off_request ep_ctrlr_pll_off;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup UPHY
@@ -2394,8 +2510,8 @@ struct mrq_uphy_request {
 struct mrq_uphy_response {
 	union {
 		struct cmd_uphy_margin_status_response uphy_get_margin_status;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /** @} */
 /** @endcond */
@@ -2445,31 +2561,31 @@ enum {
 struct cmd_fmon_gear_clamp_request {
 	int32_t unused;
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_fmon_gear_clamp_response {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_fmon_gear_free_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_fmon_gear_free_response {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 /** @private */
 struct cmd_fmon_gear_get_request {
-	EMPTY
-} __ABI_PACKED;
+	BPMP_ABI_EMPTY
+} BPMP_ABI_PACKED;
 
 struct cmd_fmon_gear_get_response {
 	int64_t rate;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup FMON
@@ -2502,8 +2618,8 @@ struct mrq_fmon_request {
 		struct cmd_fmon_gear_free_request fmon_gear_free;
 		/** @private */
 		struct cmd_fmon_gear_get_request fmon_gear_get;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup FMON
@@ -2527,8 +2643,8 @@ struct mrq_fmon_response {
 		/** @private */
 		struct cmd_fmon_gear_free_response fmon_gear_free;
 		struct cmd_fmon_gear_get_response fmon_gear_get;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /** @} */
 /** @endcond */
@@ -2553,13 +2669,27 @@ struct mrq_fmon_response {
  */
 enum {
 	/**
+	 * @cond DEPRECATED
 	 * @brief Retrieve specified EC status.
 	 *
 	 * mrq_response::err is 0 if the operation was successful, or @n
 	 * -#BPMP_ENODEV if target EC is not owned by BPMP @n
-	 * -#BPMP_EACCES if target EC power domain is turned off
+	 * -#BPMP_EACCES if target EC power domain is turned off @n
+	 * -#BPMP_EBADCMD if subcommand is not supported
+	 * @endcond
 	 */
-	CMD_EC_STATUS_GET = 1,
+	CMD_EC_STATUS_GET = 1,	/* deprecated */
+
+	/**
+	 * @brief Retrieve specified EC extended status (includes error
+	 *        counter and user values).
+	 *
+	 * mrq_response::err is 0 if the operation was successful, or @n
+	 * -#BPMP_ENODEV if target EC is not owned by BPMP @n
+	 * -#BPMP_EACCES if target EC power domain is turned off @n
+	 * -#BPMP_EBADCMD if subcommand is not supported
+	 */
+	CMD_EC_STATUS_EX_GET = 2,
 	CMD_EC_NUM,
 };
 
@@ -2615,13 +2745,13 @@ enum bpmp_ec_err_type {
 
 	/** @brief SW Correctable error
 	 *
-	 *  Error descriptor @ref ec_err_simple_desc.
+	 *  Error descriptor @ref ec_err_sw_error_desc.
 	 */
 	EC_ERR_TYPE_SW_CORRECTABLE		= 16,
 
 	/** @brief SW Uncorrectable error
 	 *
-	 *  Error descriptor @ref ec_err_simple_desc.
+	 *  Error descriptor @ref ec_err_sw_error_desc.
 	 */
 	EC_ERR_TYPE_SW_UNCORRECTABLE		= 17,
 
@@ -2641,9 +2771,9 @@ enum bpmp_ec_err_type {
 /** @brief Group of registers with parity error. */
 enum ec_registers_group {
 	/** @brief Functional registers group */
-	EC_ERR_GROUP_FUNC_REG		= 0,
+	EC_ERR_GROUP_FUNC_REG		= 0U,
 	/** @brief SCR registers group */
-	EC_ERR_GROUP_SCR_REG		= 1,
+	EC_ERR_GROUP_SCR_REG		= 1U,
 };
 
 /**
@@ -2652,11 +2782,11 @@ enum ec_registers_group {
  * @{
  */
 /** @brief No EC error found flag */
-#define EC_STATUS_FLAG_NO_ERROR		0x0001
+#define EC_STATUS_FLAG_NO_ERROR		0x0001U
 /** @brief Last EC error found flag */
-#define EC_STATUS_FLAG_LAST_ERROR	0x0002
+#define EC_STATUS_FLAG_LAST_ERROR	0x0002U
 /** @brief EC latent error flag */
-#define EC_STATUS_FLAG_LATENT_ERROR	0x0004
+#define EC_STATUS_FLAG_LATENT_ERROR	0x0004U
 /** @} */
 
 /**
@@ -2665,9 +2795,9 @@ enum ec_registers_group {
  * @{
  */
 /** @brief EC descriptor error resolved flag */
-#define EC_DESC_FLAG_RESOLVED		0x0001
+#define EC_DESC_FLAG_RESOLVED		0x0001U
 /** @brief EC descriptor failed to retrieve id flag */
-#define EC_DESC_FLAG_NO_ID		0x0002
+#define EC_DESC_FLAG_NO_ID		0x0002U
 /** @} */
 
 /**
@@ -2684,7 +2814,7 @@ struct ec_err_fmon_desc {
 	uint32_t fmon_faults;
 	/** @brief FMON faults access error */
 	int32_t fmon_access_error;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * |error type                       | vmon_adc_id values        |
@@ -2700,7 +2830,7 @@ struct ec_err_vmon_desc {
 	uint32_t vmon_faults;
 	/** @brief VMON faults access error */
 	int32_t vmon_access_error;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /**
  * |error type                       | reg_id values             |
@@ -2714,7 +2844,22 @@ struct ec_err_reg_parity_desc {
 	uint16_t reg_id;
 	/** @brief Register group @ref ec_registers_group */
 	uint16_t reg_group;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
+
+/**
+ * |error type                        | err_source_id values     |
+ * |--------------------------------- |--------------------------|
+ * |@ref EC_ERR_TYPE_SW_CORRECTABLE   | @ref bpmp_ec_ce_swd_ids  |
+ * |@ref EC_ERR_TYPE_SW_UNCORRECTABLE | @ref bpmp_ec_ue_swd_ids  |
+ */
+struct ec_err_sw_error_desc {
+	/** @brief Bitmask of @ref bpmp_ec_desc_flags  */
+	uint16_t desc_flags;
+	/** @brief Error source id */
+	uint16_t err_source_id;
+	/** @brief Sw error data */
+	uint32_t sw_error_data;
+} BPMP_ABI_PACKED;
 
 /**
  * |error type                              | err_source_id values      |
@@ -2724,34 +2869,36 @@ struct ec_err_reg_parity_desc {
  * |@ref EC_ERR_TYPE_ECC_DED_INTERNAL       |@ref bpmp_ec_ipath_ids     |
  * |@ref EC_ERR_TYPE_COMPARATOR             |@ref bpmp_ec_comparator_ids|
  * |@ref EC_ERR_TYPE_PARITY_SRAM            |@ref bpmp_clock_ids        |
- * |@ref EC_ERR_TYPE_SW_CORRECTABLE         |@ref bpmp_ec_misc_ids      |
- * |@ref EC_ERR_TYPE_SW_UNCORRECTABLE       |@ref bpmp_ec_misc_ids      |
- * |@ref EC_ERR_TYPE_OTHER_HW_CORRECTABLE   |@ref bpmp_ec_misc_ids      |
- * |@ref EC_ERR_TYPE_OTHER_HW_UNCORRECTABLE |@ref bpmp_ec_misc_ids      |
+ * |@ref EC_ERR_TYPE_OTHER_HW_CORRECTABLE   |@ref bpmp_ec_misc_hwd_ids  |
+ * |@ref EC_ERR_TYPE_OTHER_HW_UNCORRECTABLE |@ref bpmp_ec_misc_hwd_ids  |
  */
 struct ec_err_simple_desc {
 	/** @brief Bitmask of @ref bpmp_ec_desc_flags  */
 	uint16_t desc_flags;
 	/** @brief Error source id. Id space depends on error type. */
 	uint16_t err_source_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** @brief Union of EC error descriptors */
 union ec_err_desc {
 	struct ec_err_fmon_desc fmon_desc;
 	struct ec_err_vmon_desc vmon_desc;
 	struct ec_err_reg_parity_desc reg_parity_desc;
+	struct ec_err_sw_error_desc sw_error_desc;
 	struct ec_err_simple_desc simple_desc;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 struct cmd_ec_status_get_request {
 	/** @brief HSM error line number that identifies target EC. */
 	uint32_t ec_hsm_id;
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
 
 /** EC status maximum number of descriptors */
-#define EC_ERR_STATUS_DESC_MAX_NUM	4
+#define EC_ERR_STATUS_DESC_MAX_NUM	4U
 
+/**
+ * @cond DEPRECATED
+ */
 struct cmd_ec_status_get_response {
 	/** @brief Target EC id (the same id received with request). */
 	uint32_t ec_hsm_id;
@@ -2769,7 +2916,33 @@ struct cmd_ec_status_get_response {
 	uint32_t error_desc_num;
 	/** @brief  EC error descriptors */
 	union ec_err_desc error_descs[EC_ERR_STATUS_DESC_MAX_NUM];
-} __ABI_PACKED;
+} BPMP_ABI_PACKED;
+/** @endcond */
+
+struct cmd_ec_status_ex_get_response {
+	/** @brief Target EC id (the same id received with request). */
+	uint32_t ec_hsm_id;
+	/**
+	 * @brief Bitmask of @ref bpmp_ec_status_flags
+	 *
+	 * If NO_ERROR flag is set, error_ fields should be ignored
+	 */
+	uint32_t ec_status_flags;
+	/** @brief Found EC error index. */
+	uint32_t error_idx;
+	/** @brief  Found EC error type @ref bpmp_ec_err_type. */
+	uint32_t error_type;
+	/** @brief  Found EC mission error counter value */
+	uint32_t error_counter;
+	/** @brief  Found EC mission error user value */
+	uint32_t error_uval;
+	/** @brief  Reserved entry    */
+	uint32_t reserved;
+	/** @brief  Number of returned EC error descriptors */
+	uint32_t error_desc_num;
+	/** @brief  EC error descriptors */
+	union ec_err_desc error_descs[EC_ERR_STATUS_DESC_MAX_NUM];
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup EC
@@ -2778,9 +2951,15 @@ struct cmd_ec_status_get_response {
  * Used by the sender of an #MRQ_EC message to access ECs owned
  * by BPMP.
  *
+ * @cond DEPRECATED
  * |sub-command                 |payload                |
  * |----------------------------|-----------------------|
  * |@ref CMD_EC_STATUS_GET      |ec_status_get          |
+ * @endcond
+ *
+ * |sub-command                 |payload                |
+ * |----------------------------|-----------------------|
+ * |@ref CMD_EC_STATUS_EX_GET   |ec_status_get          |
  *
  */
 
@@ -2790,8 +2969,8 @@ struct mrq_ec_request {
 
 	union {
 		struct cmd_ec_status_get_request ec_status_get;
-	} __UNION_ANON;
-} __ABI_PACKED;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /**
  * @ingroup EC
@@ -2800,49 +2979,28 @@ struct mrq_ec_request {
  * Each sub-command supported by @ref mrq_ec_request may return
  * sub-command-specific data as indicated below.
  *
+ * @cond DEPRECATED
  * |sub-command                 |payload                 |
  * |----------------------------|------------------------|
  * |@ref CMD_EC_STATUS_GET      |ec_status_get           |
+ * @endcond
+ *
+ * |sub-command                 |payload                 |
+ * |----------------------------|------------------------|
+ * |@ref CMD_EC_STATUS_EX_GET   |ec_status_ex_get        |
  *
  */
 
 struct mrq_ec_response {
 	union {
+		/**
+		 * @cond DEPRECATED
+		 */
 		struct cmd_ec_status_get_response ec_status_get;
-	} __UNION_ANON;
-} __ABI_PACKED;
-
-/** @} */
-/** @endcond */
-
-/**
- * @ingroup MRQ_Codes
- * @def MRQ_FBVOLT_STATUS
- * @brief Provides status information about voltage state for fuse burning
- *
- * * Platforms: T194 onwards
- * @cond bpmp_t194
- * * Initiators: CCPLEX
- * * Target: BPMP
- * * Request Payload: None
- * * Response Payload: @ref mrq_fbvolt_status_response
- * @{
- */
-
-/**
- * @ingroup Fbvolt_status
- * @brief Response to #MRQ_FBVOLT_STATUS
- *
- * Value of #ready reflects if core voltages are in a suitable state for buring
- * fuses. A value of 0x1 indicates that core voltages are ready for burning
- * fuses. A value of 0x0 indicates that core voltages are not ready.
- */
-struct mrq_fbvolt_status_response {
-	/** @brief Bit [0:0] - ready status, bits [31:1] - reserved */
-	uint32_t ready;
-	/** @brief Reserved */
-	uint32_t unused;
-} __ABI_PACKED;
+		/** @endcond */
+		struct cmd_ec_status_ex_get_response ec_status_ex_get;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
 
 /** @} */
 /** @endcond */
@@ -2855,6 +3013,8 @@ struct mrq_fbvolt_status_response {
  * @{
  */
 
+/** @brief Operation not permitted */
+#define BPMP_EPERM	1
 /** @brief No such file or directory */
 #define BPMP_ENOENT	2
 /** @brief No MRQ handler */
@@ -2863,12 +3023,16 @@ struct mrq_fbvolt_status_response {
 #define BPMP_EIO	5
 /** @brief Bad sub-MRQ command */
 #define BPMP_EBADCMD	6
+/** @brief Resource temporarily unavailable */
+#define BPMP_EAGAIN	11
 /** @brief Not enough memory */
 #define BPMP_ENOMEM	12
 /** @brief Permission denied */
 #define BPMP_EACCES	13
 /** @brief Bad address */
 #define BPMP_EFAULT	14
+/** @brief Resource busy */
+#define BPMP_EBUSY	16
 /** @brief No such device */
 #define BPMP_ENODEV	19
 /** @brief Argument is a directory */
@@ -2880,10 +3044,18 @@ struct mrq_fbvolt_status_response {
 /** @brief Out of range */
 #define BPMP_ERANGE	34
 /** @brief Function not implemented */
-#define  BPMP_ENOSYS	38
+#define BPMP_ENOSYS	38
 /** @brief Invalid slot */
 #define BPMP_EBADSLT	57
+/** @brief Not supported */
+#define BPMP_ENOTSUP	134
+/** @brief No such device or address */
+#define BPMP_ENXIO	140
 
 /** @} */
 
+#if defined(BPMP_ABI_CHECKS)
+#include "bpmp_abi_checks.h"
+#endif
+
 #endif
-- 
2.17.1

