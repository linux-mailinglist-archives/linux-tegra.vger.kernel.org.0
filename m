Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375D92052FD
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Jun 2020 15:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732648AbgFWNDT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Jun 2020 09:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732621AbgFWNDT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Jun 2020 09:03:19 -0400
X-Greylist: delayed 3172 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Jun 2020 06:03:18 PDT
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31BFC061573
        for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2020 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=L8ebQa4XgTVdwYLNW83+6j8t7nF4EOLJTT/MIkR9Q58=; b=SXmNOwrvEZsYCmsITySx9/7D30
        qsSgYKq3RFT5rrpo94zyvNKXNTso8hLI659DTAkWFMzdPsqryl2IKRl8k97QOS2bH9tqCj/lpe4w6
        Q1CNSC9bmFmRvez30VsBOfvXLJyQksWo0ESmIfK2UVj3n8KhAleULaLnsmM3NIq1RzUxQ1yRIhKlK
        dz2dTFhW906x+LO7KH0/9cJe9Lrl/NHvLVq7VbycL2+yl+xu3QBM6LzuJiKCm9fLplrKWelw8bGya
        S9MjTmFpscsqE+sjhl5lgxaAyjh/jebRCrWjLcfXJczlE8w+9K+uwrMj1dvz0bUz7wI+ha+Z4t8QS
        UPy4k3PA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jnhkn-0007UK-VL; Tue, 23 Jun 2020 15:10:18 +0300
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
From:   Mikko Perttunen <cyndis@kapsi.fi>
Subject: [RFC] Host1x/TegraDRM UAPI
Message-ID: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Date:   Tue, 23 Jun 2020 15:09:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

# Host1x/TegraDRM UAPI proposal

This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace 
the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in 
many ways.

I haven't written any implementation yet -- I'll do that once there is 
some agreement on the high-level design.

Current open items:

* The syncpoint UAPI allows userspace to create sync_file FDs with 
arbitrary syncpoint fences. dma_fence code currently seems to assume all 
fences will be signaled, which would not necessarily be the case with 
this interface.
* Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present. 
Not sure if they are still needed.

## Introduction to the hardware

Tegra Host1x is a hardware block providing the following capabilities:

* Syncpoints, a unified whole-system synchronization primitive, allowing 
synchronization of work between graphics, compute and multimedia 
engines, CPUs including cross-VM synchronization, and devices on the 
PCIe bus, without incurring CPU overhead.
* Channels, a command DMA mechanism allowing asynchronous programming of 
various engines, integrating with syncpoints.
* Hardware virtualization support for syncpoints and channels. (On 
Tegra186 and newer)

This proposal defines APIs for userspace access to syncpoints and 
channels. Kernel drivers can additionally use syncpoints and channels 
internally, providing other userspace interfaces (e.g. V4L2).

Syncpoint and channel interfaces are split into separate parts, as 
syncpoints are useful as a system synchronization primitive even without 
using the engine drivers provided through TegraDRM. For example, a 
computer vision pipeline consisting of video capture, CPU processing and 
GPU processing would not necessarily use the engines provided by 
TegraDRM. See the Example workflows section for more details.

## Syncpoint interface

Syncpoints are a set of 32-bit values providing the following operations:

* Atomically increment value by one
* Read current value
* Wait until value reaches specified threshold. For waiting, the 32-bit 
value space is treated modulo 2^32; e.g. if the current value is 
0xffffffff, then value 0x0 is considered to be one increment in the future.

Each syncpoint is identified by a system-global ID ranging between [0, 
number of syncpoints supported by hardware). The entire system has 
read-only access to all syncpoints based on their ID.

Syncpoints are managed through the device node /dev/host1x provided by 
the gpu/host1x driver.

### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)

Allocates a free syncpoint, returning a file descriptor representing it. 
Only the owner of the file descriptor is allowed to mutate the value of 
the syncpoint.

```
struct host1x_ctrl_allocate_syncpoint {
        /**
         * @fd:
         *
         * [out] New file descriptor representing the allocated syncpoint.
         */
        __s32 fd;

        __u32 reserved[3];
};
```

### IOCTL HOST1X_SYNCPOINT_INFO (on syncpoint file descriptor)

Allows retrieval of system-global syncpoint ID corresponding to syncpoint.

Use cases:

* Passing ID to other system components that identify syncpoints by ID
* Debugging and testing

```
struct host1x_syncpoint_info {
        /**
         * @id:
         *
         * [out] System-global ID of the syncpoint.
         */
        __u32 id;

        __u32 reserved[3];
};
```

### IOCTL HOST1X_SYNCPOINT_INCREMENT (on syncpoint file descriptor)

Allows incrementing of the syncpoint value.

Use cases:

* Signalling work completion when executing a pipeline step on the CPU
* Debugging and testing

```
struct host1x_syncpoint_increment {
        /**
         * @count:
         *
         * [in] Number of times to increment syncpoint. Value can be
         *   observed in in-between values, but increments are atomic.
         */
        __u32 count;
};
```

### IOCTL HOST1X_READ_SYNCPOINT (on /dev/host1x)

Read the value of a syncpoint based on its ID.

Use cases:

* Allows more fine-grained tracking of task progression for debugging 
purposes

```
struct host1x_ctrl_read_syncpoint {
        /**
         * @id:
         *
         * [in] ID of syncpoint to read.
         */
        __u32 id;

        /**
         * @value:
         *
         * [out] Value of the syncpoint.
         */
        __u32 value;
};
```

### IOCTL HOST1X_CREATE_FENCE (on /dev/host1x)

Creates a new SYNC_FILE fence file descriptor for the specified 
syncpoint ID and threshold.

Use cases:

* Creating a fence when receiving ID/threshold pair from another system 
component
* Creating a postfence when executing a pipeline step on the CPU
* Creating a postfence when executing a pipeline step controlled by 
userspace (e.g. GPU userspace submission)

```
struct host1x_ctrl_create_fence {
        /**
         * @id:
         *
         * [in] ID of the syncpoint for which to create a fence.
         */
        __u32 id;

        /**
         * @threshold:
         *
         * [in] Threshold value for fence.
         */
        __u32 threshold;

        /**
         * @fence_fd:
         *
         * [out] New sync_file FD corresponding to the ID and threshold.
         */
        __s32 fence_fd;

        __u32 reserved[1];
};
```

### IOCTL HOST1X_GET_FENCE_INFO (on /dev/host1x)

Allows retrieval of the ID/threshold pairs corresponding to a SYNC_FILE 
fence or fence array.

Use cases:

* Debugging and testing
* Transmitting a fence to another system component requiring ID/threshold
* Getting ID/threshold for prefence when programming a pipeline step 
controlled by userspace (e.g. GPU userspace submission)

```
/* If set, corresponding fence is backed by Host1x syncpoints. */
#define HOST1X_CTRL_FENCE_INFO_SYNCPOINT_FENCE      (1 << 0)

struct host1x_ctrl_fence_info {
        /**
         * @flags:
         *
         * [out] HOST1X_CTRL_FENCE_INFO flags.
         */
        __u32 flags;

        /**
         * @id:
         *
         * [out] ID of the syncpoint corresponding to this fence.
         * Only set if HOST1X_CTRL_FENCE_INFO_SYNCPOINT_FENCE is set.
         */
        __u32 id;

        /**
         * @threshold:
         *
         * [out] Signalling threshold of the fence.
         * Only set if HOST1X_CTRL_FENCE_INFO_SYNCPOINT_FENCE is set.
         */
        __u32 threshold;

        __u32 reserved[1];
};

struct host1x_ctrl_get_fence_info {
        /**
         * @fence_fd:
         *
         * [in] Syncpoint-backed sync_file FD for which to retrieve info.
         */
        __s32 fence_fd;

        /**
         * @num_fences:
         *
         * [in] Size of `fence_info` array in elements.
         * [out] Number of fences held by the FD.
         */
        __u32 num_fences;

        /**
         * @fence_info:
         *
         * [in] Pointer to array of 'struct host1x_ctrl_fence_info' 
where info will be stored.
         */
        __u64 fence_info;

        __u32 reserved[1];
};
```

## Channel interface

### DRM_TEGRA_OPEN_CHANNEL

```
struct drm_tegra_open_channel {
         /**
           * @class:
           *
           * [in] Host1x class (engine) the channel will target.
           */
         __u32 host1x_class;

         /**
           * @flags:
           *
           * [in] Flags. Currently none are specified.
           */
         __u32 flags;

         /**
           * @channel_id:
           *
           * [out] Process-specific identifier corresponding to opened
           *   channel. Not the hardware channel ID.
           */
         __u32 channel_id;

         /**
          * @hardware_version:
          *
          * [out] Hardware version of the engine targeted by the channel.
          *   Userspace can use this to select appropriate programming
          *   sequences.
          */
         __u32 hardware_version;

         /**
          * @mode:
          *
          * [out] Mode the hardware is executing in. Some engines can be
          *   configured with different firmware supporting different
          *   functionality depending on the system configuration. This
          *   value allows userspace to detect if the engine is configured
          *   for the intended use case.
          */
         __u32 mode;

         __u32 reserved[3];
};
```

### DRM_TEGRA_CLOSE_CHANNEL

```
struct drm_tegra_close_channel {
         /**
           * @channel_id:
           *
           * [in] ID of channel to close.
           */
         __u32 channel_id;

         __u32 reserved[3];
};
```

### DRM_TEGRA_CHANNEL_MAP

Make memory accessible by the engine while executing work on the channel.

```
#define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)

struct drm_tegra_channel_map {
         /*
          * [in] ID of the channel for which to map memory to.
          */
         __u32 channel_id;

         /*
          * [in] GEM handle of the memory to map.
          */
         __u32 handle;

         /*
          * [in] Offset in GEM handle of the memory area to map.
          *
          * Must be aligned by 4K.
          */
         __u64 offset;

         /*
          * [in] Length of memory area to map in bytes.
          *
          * Must be aligned by 4K.
          */
         __u64 length;

         /*
          * [out] IOVA of mapped memory. Userspace can use this IOVA
          *   directly to refer to the memory to skip using relocations.
          *   Only available if hardware memory isolation is enabled.
          *
          *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
          */
         __u64 iova;

         /*
          * [out] ID corresponding to the mapped memory to be used for
          *   relocations or unmapping.
          */
         __u32 mapping_id;

         /*
          * [in] Flags.
          */
         __u32 flags;

         __u32 reserved[6];
};
```

### DRM_TEGRA_CHANNEL_UNMAP

Unmap previously mapped memory. Userspace shall do this only after it 
has determined the channel will no longer access the memory.

```
struct drm_tegra_channel_unmap {
         /*
          * [in] ID of the mapping to remove.
          */
         __u32 mapping_id;

         __u32 reserved[3];
};
```

### DRM_TEGRA_CHANNEL_SUBMIT

Submit a job to the engine/class targeted by the channel.

```
struct drm_tegra_submit_syncpt_incr {
         /*
          * [in] Syncpoint FD of the syncpoint that the job will
          *   increment.
          */
         __s32 syncpt_fd;

         /*
          * [in] Number of increments that the job will do.
          */
         __u32 num_incrs;

         /*
          * [out] Value the syncpoint will have once all increments have
          *   executed.
          */
         __u32 fence_value;

         __u32 reserved[1];
};

/* Sets paddr/IOVA bit 39 on T194 to enable MC swizzling */
#define DRM_TEGRA_SUBMIT_RELOCATION_BLOCKLINEAR   (1<<0)

struct drm_tegra_submit_relocation {
         /* [in] Index of GATHER or GATHER_UPTR command in commands. */
         __u32 gather_command_index;

         /*
          * [in] Mapping handle (obtained through CHANNEL_MAP) of the memory
          *   the address of which will be patched in.
          */
         __u32 mapping_id;

         /*
          * [in] Offset in the gather that will be patched.
          */
         __u64 gather_offset;

         /*
          * [in] Offset in target buffer whose paddr/IOVA will be written
          *   to the gather.
          */
         __u64 target_offset;

         /*
          * [in] Number of bits the resulting address will be logically
          *   shifted right before writing to gather.
          */
         __u32 shift;

         __u32 reserved[1];
};

/* Command is an opcode gather from a GEM handle */
#define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
/* Command is an opcode gather from a user pointer */
#define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
/* Command is a wait for syncpt fence completion */
#define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCPT        2
/* Command is a wait for SYNC_FILE FD completion */
#define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNC_FILE     3
/* Command is a wait for DRM syncobj completion */
#define DRM_TEGRA_SUBMIT_COMMAND_WAIT_SYNCOBJ       4

/*
  * Allow driver to skip command execution if engine
  * was not accessed by another channel between
  * submissions.
  */
#define DRM_TEGRA_SUBMIT_CONTEXT_SETUP                        (1<<0)

struct drm_tegra_submit_command {
         __u16 type;
         __u16 flags;

         union {
                 struct {
                     /* GEM handle */
                     __u32 handle;

                     /*
                      * Offset into GEM object in bytes.
                      * Must be aligned by 4.
                      */
                     __u64 offset;

                     /*
                      * Length of gather in bytes.
                      * Must be aligned by 4.
                      */
                     __u64 length;
                 } gather;

                 struct {
                         __u32 reserved[1];

                         /*
                          * Pointer to gather data.
                          * Must be aligned by 4 bytes.
                          */
                         __u64 base;

                         /*
                          * Length of gather in bytes.
                          * Must be aligned by 4.
                          */
                         __u64 length;
                 } gather_uptr;

                 struct {
                     __u32 syncpt_id;
                     __u32 threshold;

                     __u32 reserved[1];
                 } wait_syncpt;

                 struct {
                         __s32 fd;
                 } wait_sync_file;

                 struct {
                         __u32 handle;
                 } wait_syncobj;
         };
};


#define DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE      (1<<0)
#define DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ        (1<<1)

struct drm_tegra_channel_submit {
         __u32 channel_id;
         __u32 flags;

         /**
          * [in] Timeout in microseconds after which the kernel may
          *   consider the job to have hung and may reap it and
          *   fast-forward its syncpoint increments.
          *
          *   The value may be capped by the kernel.
          */
         __u32 timeout;

         __u32 num_syncpt_incrs;
         __u32 num_relocations;
         __u32 num_commands;

         __u64 syncpt_incrs;
         __u64 relocations;
         __u64 commands;

         /**
          * [out] Invalid, SYNC_FILE FD or syncobj handle, depending on
          *   if DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE,
          *   DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ, or neither are passed.
          *   Passing both is an error.
          *
          * The created fence object is signaled when all syncpoint
          * increments specified in `syncpt_incrs' have executed.
          */
         __u32 post_fence;

         __u32 reserved[3];
};
```

## Example workflows

### Image processing with TegraDRM/VIC

This example is a simple single-step operation using VIC through 
TegraDRM. For example, assume we have a dma-buf fd with an image we want 
to convert from YUV to RGB. This can occur for example as part of video 
decoding.

Syncpoint initialization

1. Allocate syncpoint (HOST1X_ALLOCATE_SYNCPOINT)
    1. This is used to track VIC submission completion.
2. Retrieve syncpoint ID (HOST1X_SYNCPOINT_INFO)
    1. The ID is required to program the increment as part of the 
submission.

Buffer allocation

3. Allocate memory for configuration buffers (DMA Heaps)
4. Import configuration buffer dma-buf as GEM object
5. Import input image dma-buf as GEM object

Channel initialization

6. Open VIC channel (DRM_TEGRA_OPEN_CHANNEL)
7. Map buffers for access by VIC (DRM_TEGRA_CHANNEL_MAP)
8. Create Host1x opcode buffer as userspace memory
    1. If buffer mapping returned an IOVA, that IOVA can be placed 
directly into the buffer. Otherwise, a relocation has to be passed as 
part of the submission
    2. The buffer should contain a syncpoint increment for the syncpoint 
allocated earlier.
9. Submit work, passing in the syncpoint file descriptor allocated in 
the beginning. The submit optionally returns a syncfd/syncobj that can 
be used to wait for submission completion.
    1. If more fine-grained syncpoint waiting is required, the 'fence' 
out-parameter of 'drm_tegra_submit_syncpt_incr' can be used in 
conjunction with HOST1X_CREATE_FENCE to create specific fences.

### Camera-GPU-CPU pipeline without TegraDRM

This example shows a pipeline with image input from a camera being 
processed using the GPU programmed from userspace, and then finally 
analyzed by CPU. This kind of usecase can occur e.g. as part of a 
computer vision usecase.

Syncpoint initialization

1. Camera V4L2 driver allocates a syncpoint internally within the kernel.
2. For CPU job tracking, allocate a syncpoint as in "Image processing 
with TegraDRM/VIC".
3. For GPU job tracking, the GPU kernel driver would allocate a 
syncpoint and assign it such that the GPU channel can access it.

Camera pipeline step

4. Allocate a dma-buf to store the captured image.
5. Trigger camera capture and store the resulting sync_file fd.

GPU pipeline step

6. Use HOST1X_GET_FENCE_INFO to extract syncpoint ID/threshold pair(s) 
from camera step's post-fence sync_file FD. If the sync_file FD is not 
backed by syncpoints, wait for the sync_file FD to signal otherwise 
(e.g. through polling it).
7. Use HOST1X_CREATE_FENCE to create a postfence that is signaled when 
the GPU step is complete.
8. Program the GPU to
    1. Wait for the syncpoint thresholds extracted from the camera 
postfence, if we were able to do so.
    2. Execute image processing on GPU.
    3. Increment GPU's job tracking syncpoint, causing the GPU 
post-fence FD to get signaled.

CPU pipeline step

9. Wait for GPU's post-fence sync_file FD
10. Map the dma-buf containing the image and retrieve results.

In place of the GPU pipeline step, a similar workflow would apply for a 
step executed on the CPU.

--

thanks,
Mikko

