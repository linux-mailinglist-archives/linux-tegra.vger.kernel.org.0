Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E8C21C869
	for <lists+linux-tegra@lfdr.de>; Sun, 12 Jul 2020 12:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgGLKBh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 12 Jul 2020 06:01:37 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6988 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbgGLKBg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Jul 2020 06:01:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0adf730000>; Sun, 12 Jul 2020 03:01:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:01:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 12 Jul 2020 03:01:35 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:01:35 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:01:35 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0adf7e0000>; Sun, 12 Jul 2020 03:01:35 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/5] firmware: tegra: Add support for in-band debug
Date:   Sun, 12 Jul 2020 11:01:17 +0100
Message-ID: <20200712100118.13343-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200712100118.13343-1-jonathanh@nvidia.com>
References: <20200712100118.13343-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594548083; bh=wpZE9VtQ0zPj2eCbEKJmzmcK/up//VPbtQogdVOMWHQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MNpIxE6n7Wh8smKtr634++Q0d+4MdBIVX6RyzBdqVXUbcoQ83XIsJgSyglaOe7krw
         rHkR+icxPd6KEHJWPPHAtAjdQdg7rVMeOzqXW6PZkX4hkDESQqjtbwO6VI1377cyBp
         U6X8xGmAguN7L9GnPtLPhLoIRmddWXWJvlX1CgAupgWwX+wrgg3H0clODLoerx8LL0
         4uSfFX4AHkauOvSNG5PZIIonsEV6agIv0i2yW9U/0eqfoyJbezB49cTYKbpxaI+vGF
         D3Ueh/id8UwV0KsWVUGhrbrbmZvtJmHoQQ0BtcuSzaJaH6cL5CAW/5UPzoGfbOVqQX
         wakw39ncqrkSA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for retrieving BPMP debug information via in-band messaging
as opposed to using shared-memory which older BPMP firmware used. Note
that it is possible to detect at runtime whether the BPMP firmware being
used supports the in-band messaging for retrieving the debug
informaation. Therefore, if the BPMP firmware supports the in-band
messaging for debug use this and otherwise fall-back to using shared
memory.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 377 +++++++++++++++++++++++++-
 include/soc/tegra/bpmp-abi.h          | 189 ++++++++++++-
 2 files changed, 557 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index a1a1a3b9e667..fb269f940a35 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -4,11 +4,14 @@
  */
 #include <linux/debugfs.h>
 #include <linux/dma-mapping.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #include <soc/tegra/bpmp.h>
 #include <soc/tegra/bpmp-abi.h>
 
+static DEFINE_MUTEX(bpmp_debug_lock);
+
 struct seqbuf {
 	char *buf;
 	size_t pos;
@@ -96,6 +99,354 @@ static const char *get_filename(struct tegra_bpmp *bpmp,
 	return filename;
 }
 
+static int mrq_debug_open(struct tegra_bpmp *bpmp, const char *name,
+			  uint32_t *fd, uint32_t *len, bool write)
+{
+	struct mrq_debug_request req = {
+		.cmd = cpu_to_le32(write ? CMD_DEBUG_OPEN_WO : \
+				   CMD_DEBUG_OPEN_RO),
+	};
+	struct mrq_debug_response resp;
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_DEBUG,
+		.tx = {
+			.data = &req,
+			.size = sizeof(req),
+		},
+		.rx = {
+			.data = &resp,
+			.size = sizeof(resp),
+		},
+	};
+	ssize_t sz_name;
+	int err = 0;
+
+	sz_name = strscpy(req.fop.name, name, sizeof(req.fop.name));
+	if (sz_name < 0) {
+		pr_err("File name too large: %s\n", name);
+		return -EINVAL;
+	}
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err < 0)
+		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
+
+	*len = resp.fop.datalen;
+	*fd = resp.fop.fd;
+
+	return 0;
+}
+
+static int mrq_debug_close(struct tegra_bpmp *bpmp, uint32_t fd)
+{
+	struct mrq_debug_request req = {
+		.cmd = cpu_to_le32(CMD_DEBUG_CLOSE),
+		.frd = {
+			.fd = fd,
+		},
+	};
+	struct mrq_debug_response resp;
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_DEBUG,
+		.tx = {
+			.data = &req,
+			.size = sizeof(req),
+		},
+		.rx = {
+			.data = &resp,
+			.size = sizeof(resp),
+		},
+	};
+	int err = 0;
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err < 0)
+		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mrq_debug_read(struct tegra_bpmp *bpmp, const char *name,
+			  char *data, size_t sz_data, uint32_t *nbytes)
+{
+	struct mrq_debug_request req = {
+		.cmd = cpu_to_le32(CMD_DEBUG_READ),
+	};
+	struct mrq_debug_response resp;
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_DEBUG,
+		.tx = {
+			.data = &req,
+			.size = sizeof(req),
+		},
+		.rx = {
+			.data = &resp,
+			.size = sizeof(resp),
+		},
+	};
+	uint32_t fd = 0, len = 0;
+	int remaining, err;
+
+	mutex_lock(&bpmp_debug_lock);
+	err = mrq_debug_open(bpmp, name, &fd, &len, 0);
+	if (err)
+		goto out;
+
+	if (len > sz_data) {
+		err = -EFBIG;
+		goto close;
+	}
+
+	req.frd.fd = fd;
+	remaining = len;
+
+	while (remaining > 0) {
+		err = tegra_bpmp_transfer(bpmp, &msg);
+		if (err < 0) {
+			goto close;
+		} else if (msg.rx.ret < 0) {
+			err = -EINVAL;
+			goto close;
+		}
+
+		if (resp.frd.readlen > remaining) {
+			pr_err("%s: read data length invalid\n", __func__);
+			err = -EINVAL;
+			goto close;
+		}
+
+		memcpy(data, resp.frd.data, resp.frd.readlen);
+		data += resp.frd.readlen;
+		remaining -= resp.frd.readlen;
+	}
+
+	*nbytes = len;
+
+close:
+	err = mrq_debug_close(bpmp, fd);
+out:
+	mutex_unlock(&bpmp_debug_lock);
+	return err;
+}
+
+static int mrq_debug_write(struct tegra_bpmp *bpmp, const char *name,
+			   uint8_t *data, size_t sz_data)
+{
+	struct mrq_debug_request req = {
+		.cmd = cpu_to_le32(CMD_DEBUG_WRITE)
+	};
+	struct mrq_debug_response resp;
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_DEBUG,
+		.tx = {
+			.data = &req,
+			.size = sizeof(req),
+		},
+		.rx = {
+			.data = &resp,
+			.size = sizeof(resp),
+		},
+	};
+	uint32_t fd = 0, len = 0;
+	int remaining, err;
+
+	mutex_lock(&bpmp_debug_lock);
+	err = mrq_debug_open(bpmp, name, &fd, &len, 1);
+	if (err)
+		goto out;
+
+	if (sz_data > len) {
+		err = -EINVAL;
+		goto close;
+	}
+
+	req.fwr.fd = fd;
+	remaining = sz_data;
+
+	while (remaining > 0) {
+		len = min(remaining, (int)sizeof(req.fwr.data));
+		memcpy(req.fwr.data, data, len);
+		req.fwr.datalen = len;
+
+		err = tegra_bpmp_transfer(bpmp, &msg);
+		if (err < 0) {
+			goto close;
+		} else if (msg.rx.ret < 0) {
+			err = -EINVAL;
+			goto close;
+		}
+
+		data += req.fwr.datalen;
+		remaining -= req.fwr.datalen;
+	}
+
+close:
+	err = mrq_debug_close(bpmp, fd);
+out:
+	mutex_unlock(&bpmp_debug_lock);
+	return err;
+}
+
+static int bpmp_debug_show(struct seq_file *m, void *p)
+{
+	struct file *file = m->private;
+	struct inode *inode = file_inode(file);
+	struct tegra_bpmp *bpmp = inode->i_private;
+	char *databuf = NULL;
+	char fnamebuf[256];
+	const char *filename;
+	uint32_t nbytes = 0;
+	size_t len;
+	int err;
+
+	len = seq_get_buf(m, &databuf);
+	if (!databuf)
+		return -ENOMEM;
+
+	filename = get_filename(bpmp, file, fnamebuf, sizeof(fnamebuf));
+	if (!filename)
+		return -ENOENT;
+
+	err = mrq_debug_read(bpmp, filename, databuf, len, &nbytes);
+	if (!err)
+		seq_commit(m, nbytes);
+
+	return err;
+}
+
+static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,
+		size_t count, loff_t *f_pos)
+{
+	struct inode *inode = file_inode(file);
+	struct tegra_bpmp *bpmp = inode->i_private;
+	char *databuf = NULL;
+	char fnamebuf[256];
+	const char *filename;
+	ssize_t err;
+
+	filename = get_filename(bpmp, file, fnamebuf, sizeof(fnamebuf));
+	if (!filename)
+		return -ENOENT;
+
+	databuf = kmalloc(count, GFP_KERNEL);
+	if (!databuf)
+		return -ENOMEM;
+
+	if (copy_from_user(databuf, buf, count)) {
+		err = -EFAULT;
+		goto free_ret;
+	}
+
+	err = mrq_debug_write(bpmp, filename, databuf, count);
+
+free_ret:
+	kfree(databuf);
+
+	return err ?: count;
+}
+
+static int bpmp_debug_open(struct inode *inode, struct file *file)
+{
+	return single_open_size(file, bpmp_debug_show, file, SZ_256K);
+}
+
+static const struct file_operations bpmp_debug_fops = {
+	.open		= bpmp_debug_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.write		= bpmp_debug_store,
+	.release	= single_release,
+};
+
+static int bpmp_populate_debugfs_inband(struct tegra_bpmp *bpmp,
+					struct dentry *parent,
+					char *ppath)
+{
+	const size_t pathlen = SZ_256;
+	const size_t bufsize = SZ_16K;
+	uint32_t dsize, attrs = 0;
+	struct dentry *dentry;
+	struct seqbuf seqbuf;
+	char *buf, *pathbuf;
+	const char *name;
+	int err = 0;
+
+	if (!bpmp || !parent || !ppath)
+		return -EINVAL;
+
+	buf = kmalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	pathbuf = kzalloc(pathlen, GFP_KERNEL);
+	if (!pathbuf) {
+		kfree(buf);
+		return -ENOMEM;
+	}
+
+	err = mrq_debug_read(bpmp, ppath, buf, bufsize, &dsize);
+	if (err)
+		goto out;
+
+	seqbuf_init(&seqbuf, buf, dsize);
+
+	while (!seqbuf_eof(&seqbuf)) {
+		err = seqbuf_read_u32(&seqbuf, &attrs);
+		if (err)
+			goto out;
+
+		err = seqbuf_read_str(&seqbuf, &name);
+		if (err < 0)
+			goto out;
+
+		if (attrs & DEBUGFS_S_ISDIR) {
+			size_t len;
+
+			dentry = debugfs_create_dir(name, parent);
+			if (IS_ERR(dentry)) {
+				err = PTR_ERR(dentry);
+				goto out;
+			}
+
+			len = strlen(ppath) + strlen(name) + 1;
+			if (len >= pathlen) {
+				err = -EINVAL;
+				goto out;
+			}
+
+			strncpy(pathbuf, ppath, pathlen);
+			strncat(pathbuf, name, strlen(name));
+			strcat(pathbuf, "/");
+
+			err = bpmp_populate_debugfs_inband(bpmp, dentry,
+							   pathbuf);
+			if (err < 0)
+				goto out;
+		} else {
+			umode_t mode;
+
+			mode = attrs & DEBUGFS_S_IRUSR ? S_IRUSR : 0;
+			mode |= attrs & DEBUGFS_S_IWUSR ? S_IWUSR : 0;
+			dentry = debugfs_create_file(name, mode, parent, bpmp,
+						     &bpmp_debug_fops);
+			if (!dentry) {
+				err = -ENOMEM;
+				goto out;
+			}
+		}
+	}
+
+out:
+	kfree(pathbuf);
+	kfree(buf);
+
+	return err;
+}
+
 static int mrq_debugfs_read(struct tegra_bpmp *bpmp,
 			    dma_addr_t name, size_t sz_name,
 			    dma_addr_t data, size_t sz_data,
@@ -354,8 +705,7 @@ static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
 	return 0;
 }
 
-static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp,
-				       struct dentry *root)
+static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp)
 {
 	struct seqbuf seqbuf;
 	const size_t sz = SZ_512K;
@@ -364,10 +714,6 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp,
 	void *virt;
 	int err;
 
-	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
-	if (!bpmp->debugfs_mirror)
-		return -ENOMEM;
-
 	virt = dma_alloc_coherent(bpmp->dev, sz, &phys,
 				  GFP_KERNEL | GFP_DMA32);
 	if (!virt)
@@ -392,16 +738,31 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp,
 int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 {
 	struct dentry *root;
+	bool inband;
 	int err;
 
-	if (!tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
+	inband = tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUG);
+
+	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
 		return 0;
 
 	root = debugfs_create_dir("bpmp", NULL);
 	if (!root)
 		return -ENOMEM;
 
-	err = bpmp_populate_debugfs_shmem(bpmp, root);
+	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
+	if (!bpmp->debugfs_mirror) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	if (inband)
+		err = bpmp_populate_debugfs_inband(bpmp, bpmp->debugfs_mirror,
+						   "/");
+	else
+		err = bpmp_populate_debugfs_shmem(bpmp);
+
+out:
 	if (err < 0)
 		debugfs_remove_recursive(root);
 
diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 8f8e73e5cd45..4896227eef1a 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -148,6 +148,7 @@ struct mrq_response {
 #define MRQ_FMON		72
 #define MRQ_EC			73
 #define MRQ_FBVOLT_STATUS	74
+#define MRQ_DEBUG		75
 
 /** @} */
 
@@ -156,7 +157,7 @@ struct mrq_response {
  * @brief Maximum MRQ code to be sent by CPU software to
  * BPMP. Subject to change in future
  */
-#define MAX_CPU_MRQ_ID		74
+#define MAX_CPU_MRQ_ID		75
 
 /**
  * @addtogroup MRQ_Payloads
@@ -532,6 +533,8 @@ struct mrq_module_mail_response {
  * @def MRQ_DEBUGFS
  * @brief Interact with BPMP's debugfs file nodes
  *
+ * @deprecated use MRQ_DEBUG instead.
+ *
  * * Platforms: T186, T194
  * * Initiators: Any
  * * Targets: BPMP
@@ -671,6 +674,190 @@ struct mrq_debugfs_response {
 #define DEBUGFS_S_IWUSR	(1 << 7)
 /** @} */
 
+/**
+ * @ingroup MRQ_Codes
+ * @def MRQ_DEBUG
+ * @brief Interact with BPMP's debugfs file nodes. Use message payload
+ * for exchanging data. This is functionally equivalent to
+ * @ref MRQ_DEBUGFS. But the way in which data is exchanged is different.
+ * When software running on CPU tries to read a debugfs file,
+ * the file path and read data will be stored in message payload.
+ * Since the message payload size is limited, a debugfs file
+ * transaction might require multiple frames of data exchanged
+ * between BPMP and CPU until the transaction completes.
+ *
+ * * Platforms: T194
+ * * Initiators: Any
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_debug_request
+ * * Response Payload: @ref mrq_debug_response
+ */
+
+/** @ingroup Debugfs */
+enum mrq_debug_commands {
+	/** @brief Open required file for read operation */
+	CMD_DEBUG_OPEN_RO = 0,
+	/** @brief Open required file for write operation */
+	CMD_DEBUG_OPEN_WO = 1,
+	/** @brief Perform read */
+	CMD_DEBUG_READ = 2,
+	/** @brief Perform write */
+	CMD_DEBUG_WRITE = 3,
+	/** @brief Close file */
+	CMD_DEBUG_CLOSE = 4,
+	/** @brief Not a command */
+	CMD_DEBUG_MAX
+};
+
+/**
+ * @ingroup Debugfs
+ * @brief Maximum number of files that can be open at a given time
+ */
+#define DEBUG_MAX_OPEN_FILES	1
+
+/**
+ * @ingroup Debugfs
+ * @brief Maximum size of null-terminated file name string in bytes.
+ * Value is derived from memory available in message payload while
+ * using @ref cmd_debug_fopen_request
+ * Value 4 corresponds to size of @ref mrq_debug_commands
+ * in @ref mrq_debug_request.
+ * 120 - 4 dbg_cmd(32bit)  = 116
+ */
+#define DEBUG_FNAME_MAX_SZ	(MSG_DATA_MIN_SZ - 4)
+
+/**
+ * @ingroup Debugfs
+ * @brief Parameters for CMD_DEBUG_OPEN command
+ */
+struct cmd_debug_fopen_request {
+	/** @brief File name - Null-terminated string with maximum
+	 * length @ref DEBUG_FNAME_MAX_SZ
+	 */
+	char name[DEBUG_FNAME_MAX_SZ];
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ * @brief Response data for CMD_DEBUG_OPEN_RO/WO command
+ */
+struct cmd_debug_fopen_response {
+	/** @brief Identifier for file access */
+	uint32_t fd;
+	/** @brief Data length. File data size for READ command.
+	 * Maximum allowed length for WRITE command
+	 */
+	uint32_t datalen;
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ * @brief Parameters for CMD_DEBUG_READ command
+ */
+struct cmd_debug_fread_request {
+	/** @brief File access identifier received in response
+	 * to CMD_DEBUG_OPEN_RO request
+	 */
+	uint32_t fd;
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ * @brief Maximum size of read data in bytes.
+ * Value is derived from memory available in message payload while
+ * using @ref cmd_debug_fread_response.
+ */
+#define DEBUG_READ_MAX_SZ	(MSG_DATA_MIN_SZ - 4)
+
+/**
+ * @ingroup Debugfs
+ * @brief Response data for CMD_DEBUG_READ command
+ */
+struct cmd_debug_fread_response {
+	/** @brief Size of data provided in this response in bytes */
+	uint32_t readlen;
+	/** @brief File data from seek position */
+	char data[DEBUG_READ_MAX_SZ];
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ * @brief Maximum size of write data in bytes.
+ * Value is derived from memory available in message payload while
+ * using @ref cmd_debug_fwrite_request.
+ */
+#define DEBUG_WRITE_MAX_SZ	(MSG_DATA_MIN_SZ - 12)
+
+/**
+ * @ingroup Debugfs
+ * @brief Parameters for CMD_DEBUG_WRITE command
+ */
+struct cmd_debug_fwrite_request {
+	/** @brief File access identifier received in response
+	 * to CMD_DEBUG_OPEN_RO request
+	 */
+	uint32_t fd;
+	/** @brief Size of write data in bytes */
+	uint32_t datalen;
+	/** @brief Data to be written */
+	char data[DEBUG_WRITE_MAX_SZ];
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ * @brief Parameters for CMD_DEBUG_CLOSE command
+ */
+struct cmd_debug_fclose_request {
+	/** @brief File access identifier received in response
+	 * to CMD_DEBUG_OPEN_RO request
+	 */
+	uint32_t fd;
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ * @brief Request with #MRQ_DEBUG.
+ *
+ * The sender of an MRQ_DEBUG message uses #cmd to specify a debugfs
+ * command to execute. Legal commands are the values of @ref
+ * mrq_debug_commands. Each command requires a specific additional
+ * payload of data.
+ *
+ * |command            |payload|
+ * |-------------------|-------|
+ * |CMD_DEBUG_OPEN_RO  |fop    |
+ * |CMD_DEBUG_OPEN_WO  |fop    |
+ * |CMD_DEBUG_READ     |frd    |
+ * |CMD_DEBUG_WRITE    |fwr    |
+ * |CMD_DEBUG_CLOSE    |fcl    |
+ */
+struct mrq_debug_request {
+	/** @brief Sub-command (@ref mrq_debug_commands) */
+	uint32_t cmd;
+	union {
+		/** @brief Request payload for CMD_DEBUG_OPEN_RO/WO command */
+		struct cmd_debug_fopen_request fop;
+		/** @brief Request payload for CMD_DEBUG_READ command */
+		struct cmd_debug_fread_request frd;
+		/** @brief Request payload for CMD_DEBUG_WRITE command */
+		struct cmd_debug_fwrite_request fwr;
+		/** @brief Request payload for CMD_DEBUG_CLOSE command */
+		struct cmd_debug_fclose_request fcl;
+	} __UNION_ANON;
+} __ABI_PACKED;
+
+/**
+ * @ingroup Debugfs
+ */
+struct mrq_debug_response {
+	union {
+		/** @brief Response data for CMD_DEBUG_OPEN_RO/WO command */
+		struct cmd_debug_fopen_response fop;
+		/** @brief Response data for CMD_DEBUG_READ command */
+		struct cmd_debug_fread_response frd;
+	} __UNION_ANON;
+} __ABI_PACKED;
+
 /**
  * @ingroup MRQ_Codes
  * @def MRQ_RESET
-- 
2.17.1

